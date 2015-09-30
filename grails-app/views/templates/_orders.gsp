<table class="table">
    <thead>
        <tr>
            <th>
                Name
            </th>
        </tr>
    </thead>
    <tbody>
        <!-- ko foreach: people -->
            <tr>
                <td data-bind="text: $data.name, click: $root.delete"></td>
            </tr>
        <!-- /ko -->
    </tbody>
</table>