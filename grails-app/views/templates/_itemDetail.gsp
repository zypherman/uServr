<div class="row" data-bind="with: ${detail}">
    <div class="col-xs-4">
        <h3 data-bind="text: detail.name"></h3>
        <img class="menu-item-image img-responsive" data-bind="attr: {src: '/assets/' + detail.imgSrc}"/>
        %{--<g:img class="menu-item-image img-responsive" dir="images" file="${item.name}.png"/>--}%
    </div>
    <div class="col-xs-4">
        <h3><g:message code="desc"/></h3>
        <div data-bind="text: detail.description"></div>
        <g:if test="${pour}">
            <h3><g:message code="pour"/></h3>
            <div data-bind="text: detail.pour"></div>
        </g:if>
        <g:if test="${size}">
            <h3><g:message code="size"/></h3>
            <div data-bind="text: detail.size"></div>
        </g:if>
        <h3><g:message code="price"/></h3>
        <div data-bind="text: detail.price"></div>
        <button class="btn btn-success send-order" data-bind="click: $parent.addDetail"><g:message code="addToOrder"/></button>
    </div>
</div>