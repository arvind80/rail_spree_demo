Deface::Override.new(:virtual_path => 'spree/checkout/edit',
                     :name => 'replace_checkout_tabs',
                     :replace => 'div#tabs',
                     :sequence => {:after => 'replace_checkout'},
                     :text =>%q{<div id="tabs" role="tabs">
  <ul>
    <li <%= controller.action_name == "registration" ? "class='active'" : "" %>><span class="number">1</span><span class="title">Create an Account</span></li>
    <li <%= @order.payment?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">2</span><span class="title">Shipping &amp; Billing</span></li>
    <li <%= @order.confirm? && controller.action_name != "registration" ? "class='active number'" : "class=number" %>><span class="number">3</span><span class="title">Place Order</span></li>
  </ul>
</div>})
