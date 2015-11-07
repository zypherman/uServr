<div class="top-orders">
    <h3>Your Order</h3>
</div>

<div class="orders">
    <table class="table">
        <tbody data-bind="foreach: orders">
        <tr>
            <td data-bind="click: $parent.remove"><span class="orderData" data-bind="text: name"></span><span
                    class="orderData" data-bind="text: price"></span><span class="glyphicon glyphicon-remove"></span>
            </td>
        </tr>
        </tbody>
    </table>
    <div>Total: $<span data-bind="text: total"></span></div>
    <button class="btn btn-success send-order" data-toggle="modal" data-target="#addPaymentModal">Send Order!</button>
    <g:render template="/templates/addCreditCard"/>
</div>