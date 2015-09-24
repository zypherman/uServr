<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css">
    label {
        float:left;
        width:65px;
    }
    </style>
</head>

<body>
<h1>Home Page</h1>
<g:if test="${flash.message}">
    <div class="message">
        ${flash.message}
    </div>
</g:if>
${flash.message}
<g:if test="${session.user}">
    <br/>
    Login as : ${session.user} | <g:link controller="user" action="logout">Logout</g:link>
</g:if>
<g:else>
<g:form action="login" controller="user" style="padding-left:200px">
    <div style="width:220px">
        <label>Name:</label> <input type="text" name="username">
        <label>Password:</label> <input type="password" name="password">
        <label>&nbsp;</label> <input type="submit" name="Login">
    </div>
</g:form>
</g:else>
</body>
</html>
