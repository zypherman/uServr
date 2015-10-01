<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main" />
  <title>User Login</title>
</head>
<body>
<div class="body">
  <g:form action="doLogin" method="post">
      <div class="alert alert-error" style="display: block font-color: red">${flash.error}</div>
    <div class="dialog">
      <p>Enter your login details below:</p>
      <table class="userForm">
        <tr class='prop'>
          <td valign='top' style='text-align:left;' width='20%'>
            <label for='username'>Username:</label>
          </td>
          <td valign='top' style='text-align:left;' width='80%'>
            <input id="username" type='text' name='username' value='${customer?.username}' />
          </td>
        </tr>
        <tr class='prop'>
          <td valign='top' style='text-align:left;' width='20%'>
            <label for='password'>Password:</label>
          </td>
          <td valign='top' style='text-align:left;' width='80%'>
            <input id="password" type='password' name='password'
                   value='${user?.password}' />
          </td>
        </tr>

      </table>
    </div>
    <div class="buttons">
      <span class="formButton">
        <input type="submit" value="Login"/>
      </span>
    </div>
  </g:form>
</div>
</body>
</html>