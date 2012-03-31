# Loads seed data out of default dir
#Rake::Task["db:load_dir"].invoke( "default" )
#puts "Default data has been loaded"

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
