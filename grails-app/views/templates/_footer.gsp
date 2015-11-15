<div class="${className}">
    <g:if test="${session?.customer}">
        <g:link class="btn logout" controller="login"
                action="logout">Logout</g:link>
    </g:if>
    <div class="text-center">uServr</div>
</div>
