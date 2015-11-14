function KitchenOrderViewModel() {
    var kitchenOrderViewModel = this;

    kitchenOrderViewModel.orders = ko.observableArray();

    var kitchenEvent = new EventSource('/kitchen/order');

    kitchenEvent.onmessage = function(event) {
        if (event.data.length > 2) {
            var orders = JSON.parse(event.data);
            for (var i = 0; i < orders.length; i++) {
                kitchenOrderViewModel.orders.push(orders[i]);
            }
        }
    };

    kitchenOrderViewModel.delete = function(e, d) {
        kitchenOrderViewModel.orders.remove(e);
        processKitchenOrder(e);
    };

    getCurrentKitchenOrders();

    function getCurrentKitchenOrders() {
        $.ajax({
            url: '/kitchen/getCurrentOrders'
        }).done(function(data) {
            if (data.length > 0) {
                kitchenOrderViewModel.orders(data);
            }
        }).fail(function(data) {
            console.log('fail ' + data);
        })
    }

    function processKitchenOrder(order) {
        $.ajax({
            url: '/kitchen/processOrder',
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

    ko.applyBindings(kitchenOrderViewModel, $('.table')[0]);
}

new KitchenOrderViewModel();