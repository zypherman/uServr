<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="theBar"/></title>
</head>

<body>
<g:applyLayout name="pages/bar">
    <content tag="details">
        <h1><g:message code="theBarBody"/></h1>
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