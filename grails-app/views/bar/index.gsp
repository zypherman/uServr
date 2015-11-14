<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>The Bar</title>
</head>

<body>
<g:applyLayout name="pages/bar">
    <content tag="details">
        <h1>The Bar Body</h1>
    </content>
    <content tag="templates">
        <g:render template="/templates/orders"/>
    </content>
    <content tag="scripts">
        <g:javascript src="orders/barOrders.js"/>
    </content>
</g:applyLayout>
</body>
</html>