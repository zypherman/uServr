<div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <g:if test="${session?.customer && request.requestURI.contains('customer')}">
            <h3 class="cust-name">${session?.customer?.firstName}'s <g:message code="dash"/></h3>
        </g:if>
        <g:else>
            <h3 class="text-center">${name}</h3>
        </g:else>
        <hr>
        <ul class="sidebar-nav">
            <g:each in="${links}" var="link">
                <li>
                    <g:link class="leftnav-link" controller="${link.controller}"
                            action="${link.action}">${link.name}</g:link>
                </li>
            </g:each>
            <li>
                <g:link action="index" params="[lang: message(code: 'switch')]"><g:message code="lang"/></g:link>
            </li>
        </ul>

        <g:render template="/templates/footer" model="[className: 'footer']"/>
    </div>
    <!-- /#sidebar-wrapper -->
</div>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="row">
            <div class="col-xs-3">
                <div class="navbar-header">
                    <g:if test="${session?.customer  && request.requestURI.contains('customer')}">
                        <div class="navbar-brand">${session?.customer?.firstName}'s <g:message code="dash"/></div>
                    </g:if>
                    <g:else>
                        <div class="navbar-brand">${name}</div>
                    </g:else>
                </div>
            </div>
            <div class="col-xs-9">
                <ul class="nav navbar-nav nav-ul">
                    <g:each in="${links}" var="link">
                        <li>
                            <g:link controller="${link.controller}"
                                    action="${link.action}">${link.name}</g:link>
                        </li>
                    </g:each>
                    <li>
                        <g:link action="index" params="[lang: message(code: 'switch')]"><g:message code="lang"/></g:link>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>