<div class="row">
    <div class="col-md-3">
        <div id="wrapper">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <h3>${name}</h3>
                <ul class="sidebar-nav">
                    <g:each in="${links}" var="link">
                        <li>
                            <g:link class="leftnav-link" controller="${link.controller}"
                                    action="${link.action}">${link.name}</g:link>
                        </li>
                    </g:each>
                    <li>
                        <g:if test="${session.customer}">
                            <button class="btn logout"><g:link class="logout" controller="login"
                                                               action="logout">Logout</g:link></button>
                        </g:if>
                        <g:else test="!${session.customer}">
                            <button class="btn logout"><g:link class="logout" controller="login"
                                                               action="login">Login</g:link></button>
                        </g:else>
                    </li>
                </ul>

                <div class="footer">uServr</div>
            </div>
            <!-- /#sidebar-wrapper -->
        </div>
    </div>
</div>