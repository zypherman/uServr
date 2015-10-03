<div role="heading" class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 text-center">
                <g:img class="brand center-block" dir="images" file="WaiterIcon.png" href="#"/>
            </div>

            <div class="col-md-8">
                <h1 class="title text-center">uServr</h1>
            </div>

            <div class="col-md-2">
                <g:if test="${session.customer}">
                    <div class="message user-name" role="status">Hello ${session.name}!</div>
                    <button class="btn logout"><g:link class="logout" controller="login"
                                                action="logout">Logout</g:link></button>
                </g:if>
            </div>
        </div>
    </div>
</div>