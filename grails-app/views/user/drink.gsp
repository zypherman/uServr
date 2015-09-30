<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/user">
    <content tag="details">
        <h3>Drink</h3>
        <div class="drink-table">
            <table class="table">
                <tbody data-bind="foreach: ${drinkViewModel}">
                    <tr data-bind="click: $parent.add">
                        <td data-bind="text: $data.name"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </content>
</g:applyLayout>
</body>
</html>