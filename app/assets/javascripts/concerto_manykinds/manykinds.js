// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ConcertoManykinds = {
  _initialized: false,

  initHandlers: function () {
    if (!ConcertoManykinds._initialized) {
      $('ul.manykinds-list').on('ajax:success', 'a[data-method="delete"]', function (e, data, status, xhr) {
        $(this).parent('li').hide();
      });

      $('form[id="new_manykind"]').on('ajax:success', function (e, data, status, xhr) {
        // show the new item
        $("#manykinds_fld" + data["field_id"]).append(data["item_html"]);
      });
      ConcertoManykinds._initialized = true;
    }
  }
};

$(document).ready(ConcertoManykinds.initHandlers);
$(document).on('turbolinks:load', ConcertoManykinds.initHandlers);
