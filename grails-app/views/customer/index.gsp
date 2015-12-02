<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/customer">
    <content tag="details">
        <h1 class="text-center">uServr</h1>
        <img class="img-responsive main-img" src="/assets/WaiterIcon.png"/>

        <div>
            <g:render template="/templates/menuItems"/>
        </div>
    </content>
</g:applyLayout>
</body>
</html>