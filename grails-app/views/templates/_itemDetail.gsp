<div class="row">
    <div class="col-md-3">
        <h3>${params?.name}</h3>
        <g:img class="menu-item-image img-responsive" dir="images" file="WaiterIcon.png"/>
        %{--<g:img class="menu-item-image img-responsive" dir="images" file="${item.name}.png"/>--}%
    </div>
    <div class="col-md-6">
        <h3>Item Description</h3>
        <div>${params?.description}</div>
        <h3>Item Price</h3>
        <div>${params?.price}</div>
        <button class="btn btn-success send-order" data-bind="click: $parent.add">Add to Order</button>
    </div>
</div>