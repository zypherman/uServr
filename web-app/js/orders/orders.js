function OrderViewModel() {
    orderViewModel = this;

    orderViewModel.people = ko.observableArray();

    window.p = orderViewModel.people;

    var event = new EventSource('bar/order' );

    event.onmessage = function(event) {
        console.log(event);
    };

    ko.applyBindings(orderViewModel, $('.table')[0]);
}
new OrderViewModel();