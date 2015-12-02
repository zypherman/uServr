<div class="${className}">
    <g:if test="${session?.customer && request.requestURI.contains('customer')}">
        <a class="btn logout" data-bind="click: logout">Logout</a>
    </g:if>
    <g:if test="${request.requestURI.contains('manager') || request.requestURI.contains('bar') || request.requestURI.contains('kitchen')}">
        <g:link class="btn logout" controller="login" action="logout2">Logout</g:link>
    </g:if>
    <div class="text-center"><a href="/" style="color: inherit">uServr</a></div>
</div>
