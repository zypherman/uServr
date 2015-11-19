<div class="row" data-bind="with: ${detail}">
    <div class="col-xs-4">
        <h3 data-bind="text: name"></h3>
        <img class="menu-item-image img-responsive" data-bind="attr: {src: '/assets/' + imgSrc}"/>
        %{--<g:img class="menu-item-image img-responsive" dir="images" file="${item.name}.png"/>--}%
    </div>
    <div class="col-xs-4">
        <h3>Description</h3>
        <div data-bind="text: description"></div>
        <g:if test="${pour}">
            <h3>Pour</h3>
            <div data-bind="text: pour"></div>
        </g:if>
        <g:if test="${size}">
            <h3>Size</h3>
            <div data-bind="text: size"></div>
        </g:if>
        <h3>Price</h3>
        <div data-bind="text: price"></div>
        <button class="btn btn-success send-order" data-bind="click: $parent.add">Add to Order</button>
    </div>
</div>