<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Login</title>
    <style>
    body {
        background-color: #D9EDF7;
    }
    </style>
</head>

<body>
<g:applyLayout name="pages/oneBlock">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
            </div>

            <div class="modal-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="alert alert-danger" role="alert" data-bind="visible: errorMessage, text: errorMessage"></div>
                        <g:form class="form-signin form-horizontal login-form">
                            <div class="form-group has-feedback">
                                <label for='login-pin' class="labelText">Pin:</label>
                                <input id="login-pin" type='password' name='loginPin' class="form-control"
                                       placeholder="ex. 1234" maxlength="4"/>
                            </div>

                            <div class="form-group modal-buttons">
                                <button id="submit" type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:applyLayout>
<g:javascript src="login/loginViewModel.js"/>
</body>
</html>