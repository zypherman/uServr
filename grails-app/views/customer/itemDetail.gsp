<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Item Detail</title>
  <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/customer">
  <content tag="details">
    <div class="row">
      <g:render template="/templates/itemDetail"/>
    </div>
  </content>
</g:applyLayout>
</body>
</html>