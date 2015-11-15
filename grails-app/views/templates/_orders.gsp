<div class="table-responsive">
    <table class="table">
        <tbody>
        <!-- ko foreach: orders -->
        <tr>
            <td>
                <div class="row">
                    <div class="col-sm-1"><label for="tnum">Table Number:</label> <span id="tnum"
                                                                                        data-bind="text: tableNumber"></span>
                    </div>

                    <div class="col-sm-2"><timer></timer></div>

                    <div class="col-sm-7">
                        <!-- ko foreach: orders -->
                        <div class="row well">
                            <div class="col-sm-6"><label><input type="checkbox"></label> <span id="name"
                                                                                               data-bind="text: $data.name"></span>
                            </div>

                            <div class="col-sm-6"><label for="desc">Description:</label> <span id="desc"
                                                                                               data-bind="text: $data.description"></span>
                            </div>
                        </div>
                        <!-- /ko -->
                    </div>

                    <div class="col-sm-2">
                        <a class="btn btn-block btn-success" data-bind="click: $parent.delete">process</a>
                    </div>
                </div>
            </td>
        </tr>
        <!-- /ko -->
        </tbody>
    </table>
</div>