<div class="col-md-9">
    <g:if test="${!controllerName=='login'}">
        <div>
            <g:render template="/templates/leftNav"/>
        </div>
    </g:if>
    <g:layoutBody/>
</div>