<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/customer">
  <content tag="details">
    <h3>Food</h3>
    <div class="food-table">
      <table class="table">
        <tbody data-bind="foreach: ${foodViewModel}">
        <tr data-bind="click: $parent.add">
          <td data-bind="text: $data.name"></td>
          <td data-bind="text: $data.description"></td>
          <td data-bind="text: $data.price"></td>
        </tr>
        </tbody>
      </table>
    </div>
  </content>
</g:applyLayout>
</body>
</html>