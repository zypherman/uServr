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

    $('[data-toggle="tooltip"]').tooltip();

    $.ajax({
        url: '/customer/getOrder'
    }).done(function (data) {
        userViewModel.orders(data);
    }).fail(function (data) {
        console.log('fail ' + data);
    });

    $('#pin').keyup(function() {
        validatePin();
        if ($('#pin2')[0].value.length > 0) {
            validatePin2()
        }
    });

    $('#pin2').keyup(function() {
        validatePin2();
    });

    $('#back').click(function() {
        if ($('.step2').length) {
            $('.step1').removeClass('step2');
            $('.form-two').hide();
            $('.form-one').show();
            $('#bar-two').hide();
            $('#back').text('Cancel');
        } else if ($('.step3').length) {
            $('.step1').removeClass('step3').addClass('step2');
            $('.form-three').hide();
            $('.form-two').show();
            $('#bar-three').hide();
            $('#next').text('Next');
        } else {
            $('#registerCustomerModal').modal('hide');
        }
    });

    $('#next').click(function() {
        if ($('.step2').length) {
            $('.step1').removeClass('step2').addClass('step3');
            $('.form-two').hide();
            $('.form-three').show();
            $('#bar-three').show();
            $('#next').text('Submit');
        } else if ($('.step3').length) {
            registerUser().done(function() {
                userViewModel.sendOrder();
            });
            $('#registerCustomerModal').modal('hide');
            $('.step1').removeClass('step3');
            $('.form-three').hide();
            $('.form-one').show();
            $('#bar-three').hide();
            $('#bar-two').hide();
            $('#next').text('Next');
        } else {
            $('.step1').addClass('step2');
            $('.form-one').hide();
            $('.form-two').show();
            $('#bar-two').show();
            $('#back').text('Back');
        }
    });

    $('#registerCustomerModal').on('hidden.bs.modal', function () {
        $('.new-customer')[0].reset();
    });

    function registerUser() {
        return $.ajax({
            url: '/customer/registerCustomer',
            data: $('.new-customer').serialize(),
            method: 'POST'
        });
    }

    function validatePin() {
        var element = $('#pin-group');
        if ($('#pin')[0].value.length === 4) {
            $('#pin-error').hide();
            element.removeClass('has-error');
            element.addClass('has-success');
            $('#pin-success').show();
        } else {
            $('#pin-success').hide();
            element.removeClass('has-success');
            element.addClass('has-error');
            $('#pin-error').show();
        }
    }

    function validatePin2() {
        var element = $('#pin2-group');
        if ($('#pin2')[0].value === $('#pin')[0].value) {
            $('#pin2-error').hide();
            element.removeClass('has-error');
            element.addClass('has-success');
            $('#pin2-success').show();
        } else {
            $('#pin2-success').hide();
            element.removeClass('has-success');
            element.addClass('has-error');
            $('#pin2-error').show();
        }
    }

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
