<table class="table">
    <thead>
    <tr>
        <th>
            Name
        </th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <!-- ko foreach: orders -->
    <tr>
        <td>
            <span data-bind="text: $data.name"></span>
            <div class="collapse" data-bind="attr: {id: $index}">
                <div class="well">
                    <div>
                        <b>Price: </b><span data-bind="text: $data.price"></span>
                    </div>
                    <div>
                        <b>Description: </b><span data-bind="text: $data.description"></span>
                    </div>
                </div>
            </div>
        </td>
        <td>
            <div class="bar-buttons">
                <button class="btn btn-info"
                        type="button"
                        data-toggle="collapse"
                        data-bind="attr: {'data-target': '#' + $index()}">info</button>
                <a class="btn btn-success" data-bind="click: $parent.delete">process</a>
            </div>
        </td>
    </tr>
    <!-- /ko -->
    </tbody>
</table>