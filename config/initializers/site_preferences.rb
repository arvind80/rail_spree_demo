Spree::AppConfiguration.class_eval do
  preference :homepage_groups, :string, :default => ''
  preference :paypal_express_local_confirm, :boolean, :default => true
  preference :mails_from, :string, :default => 'no-reply@spreecommerce.com'
end

# Spree::Config.set :homepage_groups => 'Slingbox,Satellite Radios,Boomboxes,Accessories,Internet Radios,Vehicle Installation'

# if ActiveRecord::Base.connection.tables.include?('spree_preferences')
#   Spree::Config.set(:site_name => 'Rails Dog Radio')
#   Spree::ActiveShipping::Config.set(:origin_country => "US")
#   Spree::ActiveShipping::Config.set(:origin_state => "MD")
#   Spree::ActiveShipping::Config.set(:origin_city => "Chevy Chase")
#   Spree::ActiveShipping::Config.set(:origin_zip => "20815")
# end

