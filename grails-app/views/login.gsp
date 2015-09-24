<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Login Page</title>
  <meta name="layout" content="main"/>
  <style type="text/css">
    label {
        float:left;
      width:65px;
    }
  </style>
</head>
<body>
  <g:form action="login" controller="user" style="padding-left:200px">
    <div style="width:220px">
      <label>Name:</label> <input type="text" name="username">
      <label>Password:</label> <input type="password" name="password">
      <label>&nbsp;</label> <input type="submit" name="Login">
    </div>
  </g:form>

</body>
</html>