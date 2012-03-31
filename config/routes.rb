RailsdogRadio::Application.routes.draw do
  root :to => "spree/homepage#show"

  # redirect railsdogradio.com to the demo subdomain
  constraints(:host => /railsdogradio.com/) do
    root :to => redirect("http://demo.spreecommerce.com")
    match '/*path', :to => redirect {|params| "http://demo.spreecommerce.com/#{params[:path]}"}
  end

  # overriding default state for custom checkout steps
  match '/checkout' => 'spree/checkout#edit', :state => 'payment', :as => :checkout
  match '/checkout/update/set_shipping' => 'spree/checkout#set_shipping', :as => :set_shipping
  match '/home', :controller => 'spree/homepage', :action => 'show'

  # Mount Spree's routes
  mount Spree::Core::Engine, :at => '/'
end
