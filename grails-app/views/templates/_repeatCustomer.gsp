<div id="tmpl-repeat-customer" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Welcome Back ${session?.customer?.firstName}!</h4>
            </div>

            <div class="modal-body">
                <!-- Register FORM STARTS HERE -->
                <div class="panel panel-default">
                    <div class="panel-heading display-table">
                        <div class="display-tr">
                            <div class="display-td">
                                <p><strong>Start a new order</strong> <span class="glyphicon glyphicon-question-sign" data-placement="right" data-toggle="tooltip" title="Simply enter your pin and the last four digits of your credit card number to complete an order."></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="alert alert-danger" role="alert" data-bind="visible: errorMessage, text: errorMessage"></div>
                        <div class="text-right">
                            All Fields Are Required.
                        </div>
                        <g:form action="repeatCustomer" method="post" class="form-signin form-horizontal repeat-customer">
                            <div class="form-group has-feedback" id="last-four-group">
                                <label for="last-four">Last 4-digits of Credit Card:</label>
                                <input id="last-four" class="form-control" type="text" maxlength="4" name="lastFour">
                            </div>
                            <div class="form-group has-feedback" id="repeat-pin-group">
                                <label for='repeat-pin' class="labelText">Pin: <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" title="Enter the 4 digit pin that you registered with. If you forgot your pin, logout and register again."></span></label>
                                <input id="repeat-pin" type='password' name='repeatPin' class="form-control" placeholder="ex. 1234" maxlength="4"/>
                            </div>
                            <div class="form-group modal-buttons">
                                <button id="submit" type="button" class="btn btn-primary" data-bind="click: validateRepeat">Submit</button>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
            <!-- Register FORM ENDS HERE -->
        </div>
    </div>
</div>
