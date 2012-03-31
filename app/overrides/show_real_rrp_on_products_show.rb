Deface::Override.new(:virtual_path => 'spree/products/show',
                     :name => 'show_real_rrp_on_products_show',
                     :replace => "span.price.discounted",
                     :text => %q{<% if @product.rrp.present? %>
  <span class="price discounted"><%= number_to_currency(@product.rrp) %></span>&nbsp;
<% end %>},
                     :sequence => {:after => 'replace_product_show'})

