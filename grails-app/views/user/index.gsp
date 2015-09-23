<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<g:applyLayout name="pages/user">
    <content tag="details">
        <h1>The User Body</h1>

        <div class="order">
            <label for="name">
                Name:
                <input id="name" type="text" name="name"/>
            </label>
            <button class="order btn-primary" name="order">Order</button>
        </div>
    </content>
    <content tag="scripts">
        <script>

            $('.order').click(function() {
                var value = $('#name').val();
                $('#name').val('');

                $.ajax({
                    url: '/bar/order',
                    method: 'POST',
                    dataType: 'json',
                    data: {
                        name: value
                    }
                });

            });



        </script>
    </content>
</g:applyLayout>
</body>
</html>