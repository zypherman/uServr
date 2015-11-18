<div class="menu">
    <h3>Featured Food</h3>
    <hr/>

    <div class="row">
        <g:each in="${featuredFood}" var="item">
            <div class="col-xs-3 thumb">
                <g:link controller="menu" action="itemDetail"
                        params="[name: item?.name, description: item?.description, price: item?.price]">
                    <label class="label">${item.name}</label>
                    <g:img class="menu-item-image img-responsive" dir="image" file="${item?.imgSrc}"/>
                </g:link>
            </div>
        </g:each>
    </div>

    <h3>Featured Drinks</h3>
    <hr/>

    <div class="row">
        <g:each in="${featuredDrinks}" var="item">
            <div class="col-xs-3 thumb">
                <g:link controller="menu" action="itemDetail"
                        params="[name: item?.name, description: item?.description, price: item?.price]">
                    <label class="label">${item.name}</label>
                    <g:img class="menu-item-image img-responsive" dir="images" file="${item?.imgSrc}"/>
                </g:link>
            </div>
        </g:each>
    </div>
</div>
