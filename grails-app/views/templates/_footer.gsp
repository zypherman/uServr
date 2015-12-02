<div class="${className}">
    <g:if test="${session?.customer && request.requestURI.contains('customer')}">
        <a class="btn logout" data-bind="click: logout">Logout</a>
    </g:if>
    <div class="text-center"><a href="/" style="color: inherit">uServr</a></div>
</div>
