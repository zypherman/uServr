function UserViewModel() {

    var userViewModel = this;

    userViewModel.orders = ko.observableArray();

    userViewModel.add = function (e) {
        userViewModel.orders.push(e);
        add(e);
    };

    userViewModel.remove = function (e) {
        userViewModel.orders.remove(e);
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

    $('.order').click(function () {
        var name = $('#name');
        var value = {name: name.val()};
        name.val('');
        $.ajax({
            url: '/bar/newOrder',
            method: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(value)
        });

    });

    ko.applyBindings(userViewModel);
}
new UserViewModel();
