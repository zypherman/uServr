function LoginViewModel() {

    var loginViewModel = this;

    loginViewModel.errorMessage = ko.observable();

    $('.login-form').submit(function(e) {
        e.preventDefault();
        loginViewModel.errorMessage('');
        $.ajax({
            url: '/login/login',
            data: $('.login-form').serialize(),
            method: 'POST'
        }).done(function(data) {
            var d = JSON.parse(data);
            if (d.message) {
                loginViewModel.errorMessage(d.message);
            } else if (d.from) {
                window.location.href = d.from;
            }
        })
    });

    ko.applyBindings(loginViewModel);
}

new LoginViewModel();