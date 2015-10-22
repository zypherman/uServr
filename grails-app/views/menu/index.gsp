<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Menu</title>
  <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/menu">
  <content tag="details">
    <div class="row">
      <g:render template="/templates/menuItems"/>
    </div>
  </content>
</g:applyLayout>
</body>
</html>