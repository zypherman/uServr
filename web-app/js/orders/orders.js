function OrderViewModel() {
    var orderViewModel = this;

    orderViewModel.orders = ko.observableArray();

    var event = new EventSource('/bar/order');

    event.onmessage = function(event) {
        if (event.data.length > 2) {
            var orders = JSON.parse(event.data);
            for (var i = 0; i < orders.length; i++) {
                orderViewModel.orders.push(orders[i]);
            }
        }
    };

    orderViewModel.delete = function(e, d) {
        orderViewModel.orders.remove(e);
        processOrder(e);
    };

    getCurrentOrders();

    function getCurrentOrders() {
        $.ajax({
            url: '/bar/getCurrentOrders'
        }).done(function(data) {
            if (data.length > 0) {
                orderViewModel.orders(data);
            }
        }).fail(function(data) {
            console.log('fail ' + data);
        })
    }

    function processOrder(order) {
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

    ko.applyBindings(orderViewModel, $('.table')[0]);

}
new OrderViewModel();