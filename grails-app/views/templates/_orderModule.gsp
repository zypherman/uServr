<div class="top-orders">
    <h3><g:message code="yourOrder"/></h3>
</div>

<div class="orders">
    <table class="table">
        <tbody data-bind="foreach: orders">
        <tr>
            <td data-bind="click: $parent.remove, attr: {id: $index}"><span class="orderData" data-bind="text: name"></span><span
                    class="orderData" data-bind="text: price"></span><span class="glyphicon glyphicon-remove"></span>
            </td>
        </tr>
        </tbody>
    </table>
    <div>Total: $<span data-bind="text: total"></span></div>
    <g:if test="${session.customer}">
        <button class="btn btn-success send-order" data-toggle="modal" data-target="#tmpl-repeat-customer" data-bind="enable: orders().length"><g:message code="sendOrder"/>!</button>
    </g:if>
    <g:else>
        <button class="btn btn-success send-order" data-toggle="modal" data-target="#registerCustomerModal" data-bind="enable: orders().length"><g:message code="sendOrder"/>!</button>
    </g:else>
</div>