// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import $ from 'jquery'
import * as datatables from 'datatables.net-bs5'

require('./user-datatable')
require('./procedure-datatable')
require('./appointment-datatable')
require('./payment-datatable')

global.$ = jQuery;

$(document).ready(function(){
  $(".add_weight_fields").click(function(){
    $("#weights").append($(this).data("field"));
  });
});