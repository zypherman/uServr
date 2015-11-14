function UserViewModel() {

    var userViewModel = this;

    userViewModel.orders = ko.observableArray();
    userViewModel.total = ko.computed(function() {
        var total = 0;
        for (var i = 0; i < userViewModel.orders().length; i++) {
            total += userViewModel.orders()[i].price;
        }
        return total;
    });

    userViewModel.add = function (e) {
        userViewModel.orders.push(e);
        add(e);
    };

    userViewModel.remove = function (e, d) {
        userViewModel.orders.splice(d.currentTarget.id, 1);
        remove(e);
    };

    userViewModel.sendOrder = function () {
        $.ajax({
            url: '/customer/sendOrder',
            method: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({order: userViewModel.orders()})
        }).done(function () {
            userViewModel.orders.removeAll();
        })
    };

    $.ajax({
        url: '/customer/getOrder'
    }).done(function (data) {
        userViewModel.orders(data);
    }).fail(function (data) {
        console.log('fail ' + data);
    });

    function add(order) {
        $.ajax({
            url: '/customer/addItem',
            method: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({order: order})
        })
    }

    function remove(order) {
        $.ajax({
            url: '/customer/removeItem',
            method: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({order: order})
        })
    }

    ko.applyBindings(userViewModel);
}
new UserViewModel();
