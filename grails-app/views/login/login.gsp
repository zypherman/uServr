<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User Login</title>
</head>

<body>
<div class="body">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <h1 class="text-center login-title">Sign in to order with uServr</h1>
            <div class="account-wall">
                <g:img class = "profile-img" dir="images" file="WaiterIcon.png"/>
                <g:form action="login" method="post" class="form-signin">
                    <table class="userForm">
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='username' class="labelText">Username:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="username" type='text' class='form-control' name='username'
                                       value='${customer?.username}' placeholder="Username" required autofocus/>
                            </td>
                        </tr>
                        <tr class='prop'>
                            <td valign='top' style='text-align:left;' width='20%'>
                                <label for='password' class="labelText">Password:</label>
                            </td>
                            <td valign='top' style='text-align:left;' width='80%'>
                                <input id="password" type='password' name='password' class="form-control"
                                       placeholder="Password" required
                                       value='${user?.password}'/>
                            </td>
                        </tr>
                    </table>
                    </div>
                    <div class="buttons">
                        <span class="formButton">
                            <input type="submit" value="Login" class='btn btn-lg btn-primary btn-block'/>
                        </span>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>