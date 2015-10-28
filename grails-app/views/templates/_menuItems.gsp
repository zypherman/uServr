<div class="menu">
    <g:each in="${menuItems}" var="item">
        <div class="col-lg-3 col-md-4 col-xs-6 thumb">
            <g:link controller="menu" action="itemDetail"
                    params="[name: item?.name, description: item?.description, price: item?.price]">
                <label class="label">${item.name}</label>
                <g:img class="menu-item-image img-responsive" dir="images" file="WaiterIcon.png"/>
            </g:link>
        </div>
    </g:each>
</div>
