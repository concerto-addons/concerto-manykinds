var ConcertoManykinds = {
  _initialized: false,

  clearAlert: function() {
    $('#manykind-alert').addClass('hide');
    $('#manykind-alert h4').innerText = '';
  },

  initHandlers: function () {
    if (!ConcertoManykinds._initialized) {
      // clear alerts on button/link
      $(document).on('click', 'ul.manykinds-list .mk-delete', ConcertoManykinds.clearAlert);
      $(document).on('click', 'form[id="new_manykind"] .mk-add', ConcertoManykinds.clearAlert);

      $('ul.manykinds-list').on('ajax:success', 'a[data-method="delete"]', function (e, data, status, xhr) {
        console.debug('firing');
        $(this).parent('li').hide();
      });

      $('form[id="new_manykind"]').on('ajax:success', function (e, data, status, xhr) {
        // show the new item
        $("#manykinds_fld" + data["field_id"]).append(data["item_html"]);
      });
      $('form[id="new_manykind"]').on('ajax:error', function (e, data, status, xhr) {
        console.debug(data.responseJSON.kind_id.join(', '));
        ConcertoManykinds.showAlert(data.responseJSON.kind_id.join(', '));
      });

      console.debug('manykinds handlers initialized');
      ConcertoManykinds._initialized = true;
    }
  },

  showAlert: function (msg) {
    $('#manykind-alert h4').text(msg);
    $('#manykind-alert').removeClass('hide');
  }
}

$(document).ready(ConcertoManykinds.initHandlers);
$(document).on('page:change', ConcertoManykinds.initHandlers);
