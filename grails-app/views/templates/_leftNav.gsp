<div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <g:if test="${session?.customer}">
            <h3 class="cust-name">${session?.customer?.firstName}'s Dash</h3>
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
        </ul>

        <div class="footer">
            <g:if test="${session?.customer}">
                <g:link class="btn logout" controller="login"
                        action="logout">Logout</g:link>
            </g:if>
            <div class="text-center">uServr</div>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->
</div>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="row">
            <div class="col-xs-4">
                <div class="navbar-header">
                    <g:if test="${session?.customer}">
                        <div class="navbar-brand">${session?.customer?.firstName}'s Dash</div>
                    </g:if>
                    <g:else>
                        <div class="navbar-brand">${name}</div>
                    </g:else>
                </div>
            </div>
            <div class="col-xs-8">
                <ul class="nav navbar-nav nav-ul">
                    <g:each in="${links}" var="link">
                        <li>
                            <g:link controller="${link.controller}"
                                    action="${link.action}">${link.name}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>
</nav>