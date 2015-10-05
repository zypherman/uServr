<div class="col-md-9 main-body">
    <g:if test="${!controllerName=='login'}">
        <div>
            <g:render template="/templates/leftNav"/>
        </div>
    </g:if>
    <g:layoutBody/>
</div>