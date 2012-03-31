Deface::Override.new(:virtual_path => 'spree/checkout/_payment',
                     :name => 'add_coupon_to_payment_step',
                     :insert_after => 'ul#payment',
                     :sequence => {:after => 'replace_payment'},
                     :text => %q{
  <% if Spree::Promotion.count > 0 %>
    <hr />
    <ul class="fields">
      <h2>Coupon Code</h2>
      <li>
        <p>If you've got a coupon code, please enter it below.</p>
        <%= render 'spree/checkout/coupon_code_field', :form => form %>
      </li>
    </ul>
  <% end %>})
