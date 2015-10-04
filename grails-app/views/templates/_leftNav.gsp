<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-md-3">
            <div id="wrapper">
                <!-- Sidebar -->
                <div id="sidebar-wrapper">
                    <ul class="sidebar-nav">
                        <li class="user-info">
                            <g:if test="${session.customer}">
                                <div class="message user-name" role="status">Hello ${session.name}!</div>
                            </g:if>
                        </li>
                        <li class="sidebar-brand">
                            <a href="#">
                                <h3>${name}</h3>
                            </a>
                        </li>
                        <li>
                            <g:link class="leftnav-link" controller="customer"
                                    action="index">Customer Home</g:link>
                        </li>
                        <li>
                            <g:link class="leftnav-link" controller="bar"
                                    action="index">Bar</g:link>
                        </li>
                        <li>
                            <g:link class="leftnav-link" controller="kitchen"
                                    action="index">Kitchen</g:link>
                        </li>
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
</div>
