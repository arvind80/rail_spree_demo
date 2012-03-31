Deface::Override.new(:virtual_path => 'spree/shared/_products',
                     :name => 'show_real_rrp_on_shared_products',
                     :replace => "span.price.discounted",
                     :text => %q{<% if product.rrp.present? %>
  <span class="price discounted"><%= number_to_currency(product.rrp) %></span>&nbsp;
<% end %>},
                     :sequence => {:after => 'replace_products'})
