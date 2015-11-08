<div id="registerCustomerModal" class="modal modal-lg fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Register Customer</h4>
            </div>

            <div class="modal-body">
                <!-- Register FORM STARTS HERE -->
                <div class="panel panel-default credit-card-box">
                    <div class="panel-heading display-table">
                        <div class="row display-tr">

                            <div class="display-td">
                                <p><strong>Register Customer Below</strong></p>
                            </div>
                        </div>
                    </div>

                <div class="panel-body">
                <form role="form" id="register-form">
                    <g:form action="registerCustomer" method="post" class="form-signin">

                        <table class="userForm">

                            <tr class='prop field'>
                                <td valign='top' style='text-align:left;' width='20%'>
                                    <label for='name' class="labelText">Name:</label>
                                </td>
                                <td valign='top' style='text-align:left;' width='80%'>
                                    <input id="name" type='text' class='form-control' name='name'
                                           value='${customer?.name}' placeholder="Customer Name" required autofocus/>
                                </td>
                            </tr>

                            <tr class='prop field'>
                                <td valign='top' style='text-align:left;' width='20%'>
                                    <label for='pin' class="labelText">Pin:</label>
                                </td>
                                <td valign='top' style='text-align:left;' width='80%'>
                                    <input id="pin" type='password' name='Pin' class="form-control"
                                           placeholder="Pin" required
                                           value='${customer?.pin}'/>
                                </td>
                            </tr>

                            <tr class='prop field'>

                                <td valign='top' style='text-align:left;' width='20%'>
                                    <label for='pin2' class="labelText">Reenter Pin:</label>
                                </td>
                                <td valign='top' style='text-align:left;' width='80%'>
                                    <input id="pin2" type='password' name='pin2' class="form-control"
                                           placeholder="Reenter Pin" required/>
                                </td>
                            </tr>

                        </table>
                        </div>
                        <div class="buttons">
                            <span class="formButton">
                                <input type="submit" value="Register" class='btn btn-lg btn-primary btn-block'/>
                            </span>
                        </div>
                    </g:form>
                </div>
            </div>
            <!-- Register FORM ENDS HERE -->
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
    </div>

</div>
