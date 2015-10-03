<div class="container-fluid main-container">
    <g:if test="${!controllerName=='login'}">
        <div>
            <g:render template="/templates/leftNav"/>
        </div>
    </g:if>
    <g:layoutBody/>
</div>