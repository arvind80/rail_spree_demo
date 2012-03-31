(function($){
  $(document).ready(function(){
    if($('#checkout_form_payment').is('*')){

      $('#checkout_form_payment').validate();

      var get_states = function(region){
        country = $('#' + region + 'country :only-child').val();
        return state_mapper[country];
      }

      var update_state = function(region) {
        states = get_states(region);

        state_select = $('#' + region + 'state select');
        state_input = $('#' + region + 'state input');

        if(states) {
          selected = state_select.val();
          state_select.html('');
          states_with_blank = [["",""]].concat(states);
          $.each(states_with_blank, function(pos,id_nm) {
            var opt = $(document.createElement('option'))
                      .attr('value', id_nm[0])
                      .html(id_nm[1]);
            if(selected==id_nm[0]){
              opt.prop("selected", true);
            }
            state_select.append(opt);
          });
          state_select.prop("disabled", false).show();
          state_input.hide().prop("disabled", true);

        } else {
          state_input.prop("disabled", false).show();
          state_select.hide().prop("disabled", true);
        }

      };

      $('#bcountry select').change(function() { update_state('b'); });
      $('#scountry select').change(function() { update_state('s'); });
      update_state('b');
      update_state('s');

      $('input#order_use_billing').click(function() {
        if($(this).is(':checked')) {
          $('#shipping .inner').hide();
          $('#shipping .inner input, #shipping .inner select').prop("disabled", true);
        } else {
          $('#shipping .inner').show();
          $('#shipping .inner input, #shipping .inner select').prop("disabled", false);
          //only want to enable relevant field
          if(get_states('s')){
            $('#sstate input').hide().prop("disabled", true);
          }else{
            $('#sstate select').hide().prop("disabled", true);
          }

        }
      }).triggerHandler('click');
    }

    if($('#checkout_form_payment').is('*')){
      // Show fields for the selected payment method
      $("input[type='radio'][name='order[payments_attributes][][payment_method_id]']").click(function(){
        $('ul#payment li.payment_method').hide();
        if(this.checked){ $('ul#payment li.payment_method.'+this.value).show(); }
      }).triggerHandler('click');
    }
  });
})(jQuery);

function disableSaveOnClick() {
  $('form.edit_spree_order').submit(function() {
    $(this).find(':submit, :image').attr('disabled', true).removeClass('primary').addClass('disabled');
  });
}