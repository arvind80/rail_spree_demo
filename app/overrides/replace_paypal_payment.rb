Deface::Override.new(:virtual_path => 'spree/checkout/payment/_paypalexpress',
                     :name => 'replace_paypal_payment',
                     :replace => 'a',
                     :text => %q{<li class="payment_method <%= payment_method.id %>" style="display:<%= checked == payment_method.id ? "block" : "none" %>;">
  <h2>Your PayPal Information</h2>
  <p>You will be redirected to PayPal's website once you've completed the rest your checkout.</p>
</li>})

