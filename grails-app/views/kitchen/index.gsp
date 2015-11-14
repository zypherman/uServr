<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/kitchen">
    <content tag="details">
        <h1>The Kitchen Body</h1>
    </content>
    <content tag="templates">
        <g:render template="/templates/orders"/>
    </content>
    <content tag="scripts">
        <g:javascript src="orders/kitchenOrders.js"/>
    </content>
</g:applyLayout>
</body>
</html>