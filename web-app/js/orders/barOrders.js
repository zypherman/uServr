function BarOrderViewModel() {
    var barOrderViewModel = this;

    barOrderViewModel.orders = ko.observableArray();

    getCurrentBarOrders();

    var barEvent = new EventSource('/bar/order');

    barEvent.onmessage = function(event) {
        if (event.data.length > 2) {
            var orders = JSON.parse(event.data);
            for (var i = 0; i < orders.length; i++) {
                barOrderViewModel.orders.push(orders[i]);
            }
        }
    };

    barOrderViewModel.delete = function(e, d) {
        barOrderViewModel.orders.remove(e);
        processBarOrder(e)
    };

    function getCurrentBarOrders() {
        $.ajax({
            url: '/bar/getCurrentOrders'
        }).done(function(data) {
            if (data.length > 0) {
                barOrderViewModel.orders(data);
            }
        }).fail(function(data) {
            console.log('fail ' + data);
        })
    }

    function processBarOrder(order) {
        $.ajax({
            url: '/bar/processOrder',
            method: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({order: order})
        })
    }

    ko.components.register('timer', {
        viewModel: function(params) {
            var self = this;
            self.timer = ko.observable();
            self.timerClass = ko.observable();

            self.timerClass('label label-success');
            time();

            function time() {
                var now = Date.now();
                setInterval(function() {
                    getTime(now);
                }, 1000);
            }

            function getTime(now) {
                var date = new Date(Date.now() - now);
                var m = format(date.getMinutes());
                var s = format(date.getSeconds());
                getTimerClass(m, s);
                self.timer(m + ':' + s);
            }

            function getTimerClass(m, s) {
                if (m < 1 && s > 30) {
                    self.timerClass('label label-danger')
                } else if (m < 1 && s > 10) {
                    self.timerClass('label label-warning')
                }
            }

            function format(i) {
                if (i < 10) {i = "0" + i}
                return i;
            }
        },
        template: '<h4><span data-bind="text: timer, attr: {class: timerClass}"></span></h4>'
    });

    ko.applyBindings(barOrderViewModel, $('.table')[0]);
}

new BarOrderViewModel();