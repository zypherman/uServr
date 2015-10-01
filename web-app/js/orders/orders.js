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
            url: 'bar/getCurrentOrders'
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
            url: 'bar/processOrder',
            method: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({order: order})
        })
    }

    ko.applyBindings(orderViewModel, $('.table')[0]);

}
new OrderViewModel();