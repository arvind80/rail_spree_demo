Deface::Override.new(:virtual_path => "spree/checkout/_confirm",
                          :name => "add_shipping_to_confirm",
                          :insert_before => "div#order-items",
                          :sequence => {:after => "replace_confirm" },
                          :text => %q{<% content_for :head do %>
  <script type="text/javascript">
    //<![CDATA[
    $(function() {
      $('#order_shipping_method_id').change(function() {
        var shipping_method_id = $(this).val();
        var selected_shipping_method = $(this).find("option[value='" + shipping_method_id + "']").html();

        $(this).find("option[value='" + shipping_method_id + "']").html("Updating...");
        $(this).attr('disabled', 'disabled');

        $.post("/checkout/update/set_shipping", { state: "payment",  "order[shipping_method_id]": shipping_method_id },
          function(data){
            var table = $('table.total tbody');
            table.html('');
            table.append('<tr><th>Subtotal</th><td>$' + parseFloat(data.order.item_total).toFixed(2) + '</td></tr>');

            $.each(data.order.adjustments, function(index, adjustment) {
              table.append('<tr><th>' + adjustment.label + '</th><td>$' + parseFloat(adjustment.amount).toFixed(2) + '</td></tr>');
            });

            table.append('<tr class="total"><th>Total</th><td>$' + parseFloat(data.order.total).toFixed(2) + '</td></tr>');

            $('#order_shipping_method_id').find("option[value='" + shipping_method_id + "']").html(selected_shipping_method);
            $('#order_shipping_method_id').removeAttr('disabled');

          }
        );

      });
    });
    //]]>
  </script>
<% end %>

  <h2>Choose A Shipping Method</h2>
  <ul class="fields">
    <li><%= form.select :shipping_method_id, @order.rate_hash.collect {|sm| [ "#{sm[:name]} - #{number_to_currency(sm[:cost])}", sm[:shipping_method].id ] } %></li>
  </ul>
})
