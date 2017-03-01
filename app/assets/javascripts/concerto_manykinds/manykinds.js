// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var manykinds_handlers_initialized = false;

function attachConcertoManykindsHandlers() {
  if (!manykinds_handlers_initialized) {
    $('ul.manykinds-list').on('ajax:success', 'a[data-method="delete"]', function (e, data, status, xhr) {
console.debug('firing');
      $(this).parent('li').hide();
    });

    $('form[id="new_manykind"]').on('ajax:success', function (e, data, status, xhr) {
      // show the new item
      $("#manykinds_fld" + data["field_id"]).append(data["item_html"]);
    });

    console.debug('manykinds handlers initialized');
    manykinds_handlers_initialized = true;
  }
}

$(document).on('turbolinks:load', attachConcertoManykindsHandlers);

