import $ from 'jquery'


document.addEventListener("turbo:load", () => {
  if($('[id^=payment-datatable]').length == 1) {
    $('#payment-datatable').DataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
      "url": $('#payment-datatable').data('source'),
      "type": 'POST',
      "headers": {'X-CSRF-Token': $('meta[name="csrf-token"]').attr("content")}
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "name"},
      {"data": "appointment_number"},
      {"data": "amount"},
      {"data": "procedure"},
      { "data": "actions", searchable: false, orderable: false },

    ], "dom": "<''<'card-body py-3 d-flex'<'text-muted'l><'ms-auto text-muted'f>>" +
               "<'table-responsive'<'col-sm-12'tr>>" +
               "<'card-footer d-flex align-items-center'<'m-0 text-muted'i><'pagination m-0 ms-auto'p>>",
        "order": [[3, "asc"]],
        language: {
          paginate: {
            next: 'next <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="9 6 15 12 9 18"></polyline></svg>',
            previous: '<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="15 6 9 12 15 18"></polyline></svg> prev'
          }
        }
    });

    $('div.dataTables_length select').removeClass( "custom-select custom-select-sm form-control form-control-sm");
    $('div.dataTables_length select').addClass( "mx-2 d-inline-block datatables-form-select");
  
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
}
});