<div class="menu">
    <h3><g:message code="fFood"/></h3>
    <hr/>

    <div class="row">
        <g:each in="${featuredFood}" var="item">
            <div class="col-xs-3 thumb">
                <g:link controller="customer" action="itemDetail"
                        params="[name: item?.name]">
                    <label class="label">${item.name}</label>
                    <g:img class="menu-item-image img-responsive" dir="image" file="${item?.imgSrc}"/>
                </g:link>
            </div>
        </g:each>
    </div>

    <h3><g:message code="fDrink"/></h3>
    <hr/>

    <div class="row">
        <g:each in="${featuredDrinks}" var="item">
            <div class="col-xs-3 thumb">
                <g:link controller="customer" action="itemDetail"
                        params="[name: item?.name]">
                    <label class="label">${item.name}</label>
                    <g:img class="menu-item-image img-responsive" dir="images" file="${item?.imgSrc}"/>
                </g:link>
            </div>
        </g:each>
    </div>
</div>
