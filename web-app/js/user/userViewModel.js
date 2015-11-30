function UserViewModel() {

    var userViewModel = this;

    userViewModel.fullName = ko.observable();
    userViewModel.fullNameValid = ko.observable(false);
    userViewModel.street = ko.observable();
    userViewModel.streetValid = ko.observable(false);
    userViewModel.city = ko.observable();
    userViewModel.cityValid = ko.observable(false);
    userViewModel.state = ko.observable();
    userViewModel.stateValid = ko.observable(false);
    userViewModel.zip = ko.observable();
    userViewModel.zipValid = ko.observable(false);
    userViewModel.validOne = ko.computed(function() {
        return userViewModel.fullNameValid() && userViewModel.streetValid()
            && userViewModel.cityValid() && userViewModel.stateValid() && userViewModel.zipValid();
    });

    userViewModel.credit = ko.observable();
    userViewModel.creditValid = ko.observable(false);
    userViewModel.expMonth = ko.observable();
    userViewModel.expMonthValid = ko.observable(false);
    userViewModel.expYear = ko.observable();
    userViewModel.expYearValid = ko.observable(false);
    userViewModel.cvv = ko.observable();
    userViewModel.cvvValid = ko.observable(false);
    userViewModel.validTwo = ko.computed(function() {
       return userViewModel.creditValid() && userViewModel.expMonthValid() && userViewModel.expYearValid() && userViewModel.cvvValid();
    });

    userViewModel.pin = ko.observable();
    userViewModel.pinValid = ko.observable(false);
    userViewModel.pin2 = ko.observable();
    userViewModel.pin2Valid = ko.observable(false);
    userViewModel.validThree = ko.computed(function() {
        return userViewModel.pinValid() && userViewModel.pin2Valid();
    });

    userViewModel.errorMessage = ko.observable();

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

    userViewModel.addDetail = function (e) {
        userViewModel.orders.push(e.detail);
        add(e.detail);
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
            window.location = '/customer/index';
        })
    };

    userViewModel.logout = function() {
        userViewModel.orders.removeAll();
        $.ajax({
           url: '/customer/removeAllItems'
        }).done(function() {
            $.ajax({
                url: '/login/logout'
            }).done(function(){
                window.location = '/customer/index';
            });
        });
    };

    userViewModel.validateRepeat = function () {
        userViewModel.errorMessage('');
        $.ajax({
            url: '/customer/repeatCustomer',
            data: $('.repeat-customer').serialize(),
            method: 'POST'
        }).done(function(data) {
            var d = JSON.parse(data);
            if (d.message) {
                userViewModel.errorMessage(d.message);
            } else {
                userViewModel.sendOrder();
            }
        })
    };

    $('#tmpl-repeat-customer').on('hidden.bs.modal', function () {
        userViewModel.errorMessage('');
        $('.repeat-customer')[0].reset();
    });

    $('[data-toggle="tooltip"]').tooltip();

    $.ajax({
        url: '/customer/getOrder'
    }).done(function (data) {
        userViewModel.orders(data);
    }).fail(function (data) {
        console.log('fail ' + data);
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
            if (userViewModel.validTwo()) {
                $('.step1').removeClass('step2').addClass('step3');
                $('.form-two').hide();
                $('.form-three').show();
                $('#bar-three').show();
                $('#next').text('Submit');
            } else {
                $('#credit').focusout();
                $('#expMonth').focusout();
                $('#expYear').focusout();
                $('#cvv').focusout();
            }
        } else if ($('.step3').length) {
            if (userViewModel.validThree()) {
                registerUser().done(function() {
                    userViewModel.sendOrder();
                });
                $('#registerCustomerModal').modal('hide');
                resetForm();
            } else {
                $('#pin').focusout();
                $('#pin2').focusout();
            }
        } else {
            $('#name').focusout();
            $('#street').focusout();
            $('#city').focusout();
            $('#state').focusout();
            $('#zip').focusout();
            if (userViewModel.validOne()) {
                $('.step1').addClass('step2');
                $('.form-one').hide();
                $('.form-two').show();
                $('#bar-two').show();
                $('#back').text('Back');
            }
        }
    });

    $('#registerCustomerModal').on('hidden.bs.modal', function () {
        $('.new-customer')[0].reset();
        resetForm();
    });

    $('#name').focusout(function() {
        if (!userViewModel.fullName()) {
            userViewModel.fullNameValid(false);
            $('#name-success').hide();
            $('#name-group').addClass('has-error').removeClass('has-success');
            $('#name-error').show();
        } else {
            userViewModel.fullNameValid(true);
            $('#name-error').hide();
            $('#name-group').addClass('has-success').removeClass('has-error');
            $('#name-success').show();
        }
    });

    $('#street').focusout(function() {
        if (!userViewModel.street()) {
            userViewModel.streetValid(false);
            $('#street-success').hide();
            $('#street-group').addClass('has-error').removeClass('has-success');
            $('#street-error').show();
        } else {
            userViewModel.streetValid(true);
            $('#street-error').hide();
            $('#street-group').addClass('has-success').removeClass('has-error');
            $('#street-success').show();
        }
    });

    $('#city').focusout(function() {
        if (!userViewModel.city()) {
            userViewModel.cityValid(false);
            $('#city-success').hide();
            $('#city-group').addClass('has-error').removeClass('has-success');
            $('#city-error').show();
        } else {
            userViewModel.cityValid(true);
            $('#city-error').hide();
            $('#city-group').addClass('has-success').removeClass('has-error');
            $('#city-success').show();
        }
    });

    $('#state').focusout(function() {
        if (!$('#state').val()) {
            userViewModel.stateValid(false);
            $('#state-success').hide();
            $('#state-group').addClass('has-error').removeClass('has-success');
            $('#state-error').show();
        } else {
            userViewModel.stateValid(true);
            $('#state-error').hide();
            $('#state-group').addClass('has-success').removeClass('has-error');
            $('#state-success').show();
        }
    });

    $('#zip').focusout(function() {
        if (!userViewModel.zip() || !(userViewModel.zip().length === 5) || !userViewModel.zip().match(/^[0-9]*$/)) {
            userViewModel.zipValid(false);
            $('#zip-success').hide();
            $('#zip-group').addClass('has-error').removeClass('has-success');
            $('#zip-error').show();
        } else {
            userViewModel.zipValid(true);
            $('#zip-error').hide();
            $('#zip-group').addClass('has-success').removeClass('has-error');
            $('#zip-success').show();
        }
    });

    $('#credit').focusout(function() {
        if (!userViewModel.credit() || userViewModel.credit().length < 15 || !userViewModel.credit().match(/^[0-9]*$/)) {
            userViewModel.creditValid(false);
            $('#credit-success').hide();
            $('#credit-group').addClass('has-error').removeClass('has-success');
            $('#credit-error').show();
        } else {
            userViewModel.creditValid(true);
            $('#credit-error').hide();
            $('#credit-group').addClass('has-success').removeClass('has-error');
            $('#credit-success').show();
        }
    });

    $('#expMonth').focusout(function() {
        if (!userViewModel.expMonth() || !userViewModel.expMonth().match(/^[0-9]*$/) || parseInt(userViewModel.expMonth()) > 12 || parseInt(userViewModel.expMonth()) < 1) {
            userViewModel.expMonthValid(false);
            $('#expMonth-success').hide();
            $('#expMonth-group').addClass('has-error').removeClass('has-success');
            $('#expMonth-error').show();
        } else {
            userViewModel.expMonthValid(true);
            $('#expMonth-error').hide();
            $('#expMonth-group').addClass('has-success').removeClass('has-error');
            $('#expMonth-success').show();
        }
    });

    $('#expYear').focusout(function() {
        if (!userViewModel.expYear() || !userViewModel.expYear().match(/^[0-9]*$/) || parseInt(userViewModel.expYear()) < parseInt(new Date().getFullYear())) {
            userViewModel.expYearValid(false);
            $('#expYear-success').hide();
            $('#expYear-group').addClass('has-error').removeClass('has-success');
            $('#expYear-error').show();
        } else {
            userViewModel.expYearValid(true);
            $('#expYear-error').hide();
            $('#expYear-group').addClass('has-success').removeClass('has-error');
            $('#expYear-success').show();
        }
    });

    $('#cvv').focusout(function() {
        if (!userViewModel.cvv() || userViewModel.cvv().length < 3 || !userViewModel.cvv().match(/^[0-9]*$/)) {
            userViewModel.cvvValid(false);
            $('#cvv-success').hide();
            $('#cvv-group').addClass('has-error').removeClass('has-success');
            $('#cvv-error').show();
        } else {
            userViewModel.cvvValid(true);
            $('#cvv-error').hide();
            $('#cvv-group').addClass('has-success').removeClass('has-error');
            $('#cvv-success').show();
        }
    });

    $('#pin').focusout(function() {
        if (!userViewModel.pin() || userViewModel.pin().length < 4 || !userViewModel.cvv().match(/^[0-9]*$/)) {
            userViewModel.pinValid(false);
            $('#pin-success').hide();
            $('#pin-group').addClass('has-error').removeClass('has-success');
            $('#pin-error').show();
        } else {
            userViewModel.pinValid(true);
            $('#pin-error').hide();
            $('#pin-group').addClass('has-success').removeClass('has-error');
            $('#pin-success').show();
        }
    });

    $('#pin2').focusout(function() {
        if (userViewModel.pin2() !== userViewModel.pin()) {
            userViewModel.pin2Valid(false);
            $('#pin2-success').hide();
            $('#pin2-group').addClass('has-error').removeClass('has-success');
            $('#pin2-error').show();
        } else {
            userViewModel.pin2Valid(true);
            $('#pin2-error').hide();
            $('#pin2-group').addClass('has-success').removeClass('has-error');
            $('#pin2-success').show();
        }
    });

    function resetForm() {
        userViewModel.fullNameValid(false);
        userViewModel.creditValid(false);
        userViewModel.pinValid(false);
        $('.step1').removeClass('step3').removeClass('step2');
        $('.form-three').hide();
        $('.form-two').hide();
        $('.form-one').show();
        $('#bar-three').hide();
        $('#bar-two').hide();
        $('#next').text('Next');
        $('#back').text('Cancel');
        userViewModel.fullName('');
        $('#name-group').removeClass('has-success').removeClass('has-error');
        $('#name-error').hide();
        $('#name-success').hide();
        userViewModel.street('');
        $('#street-group').removeClass('has-success').removeClass('has-error');
        $('#street-error').hide();
        $('#street-success').hide();
        userViewModel.city('');
        $('#city-group').removeClass('has-success').removeClass('has-error');
        $('#city-error').hide();
        $('#city-success').hide();
        userViewModel.state('');
        $('#state-group').removeClass('has-success').removeClass('has-error');
        $('#state-error').hide();
        $('#state-success').hide();
        userViewModel.zip('');
        $('#zip-group').removeClass('has-success').removeClass('has-error');
        $('#zip-error').hide();
        $('#zip-success').hide();
        userViewModel.credit('');
        $('#credit-group').removeClass('has-success').removeClass('has-error');
        $('#credit-error').hide();
        $('#credit-success').hide();
        userViewModel.expMonth('');
        $('#expMonth-group').removeClass('has-success').removeClass('has-error');
        $('#expMonth-error').hide();
        $('#expMonth-success').hide();
        userViewModel.expYear('');
        $('#expYear-group').removeClass('has-success').removeClass('has-error');
        $('#expYear-error').hide();
        $('#expYear-success').hide();
        userViewModel.cvv('');
        $('#cvv-group').removeClass('has-success').removeClass('has-error');
        $('#cvv-error').hide();
        $('#cvv-success').hide();
        userViewModel.pin('');
        $('#pin-group').removeClass('has-success').removeClass('has-error');
        $('#pin-error').hide();
        $('#pin-success').hide();
        userViewModel.pin2('');
        $('#pin2-group').removeClass('has-success').removeClass('has-error');
        $('#pin2-error').hide();
        $('#pin2-success').hide();
    }

    function registerUser() {
        return $.ajax({
            url: '/customer/registerCustomer',
            data: $('.new-customer').serialize(),
            method: 'POST'
        });
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
