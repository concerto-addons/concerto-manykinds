// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var manykinds_handlers_initialized = false;

function attachConcertoManykindsHandlers() {
  if (!manykinds_handlers_initialized) {
    $('a[data-method="delete"]').on('ajax:success', function (e, data, status, xhr) {
      $(this).parent('li').hide();
    });

    console.debug('manykinds handlers initialized');
    manykinds_handlers_initialized = true;
  }
}

$(document).ready(attachConcertoManykindsHandlers);
$(document).on('page:change', attachConcertoManykindsHandlers);

