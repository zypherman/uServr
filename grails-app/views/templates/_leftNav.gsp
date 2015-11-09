<div class="row">
    <div class="col-md-3">
        <div id="wrapper">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
            <h3>Welcome ${session?.name}</h3>
                <h3 class="text-center">${name}</h3>
                <ul class="sidebar-nav">
                    <g:each in="${links}" var="link">
                        <li>
                            <g:link class="leftnav-link" controller="${link.controller}"
                                    action="${link.action}">${link.name}</g:link>
                        </li>
                    </g:each>
                </ul>

                <div class="footer">
                    <g:if test="${session.customer}">
                        <g:link class="btn logout" controller="login"
                                action="logout">Logout</g:link>
                    </g:if>
                    <g:else test="!${session.customer}">
                        <g:link class="btn logout" controller="login"
                                action="login">Login</g:link>
                    </g:else>
                    <div class="text-center">uServr</div>
                </div>
            </div>
            <!-- /#sidebar-wrapper -->
        </div>
    </div>
</div>