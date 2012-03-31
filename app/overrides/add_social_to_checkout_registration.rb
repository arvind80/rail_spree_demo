Deface::Override.new(:virtual_path => 'spree/checkout/registration',
                     :name => 'add_social_to_checkout_registration',
                     :insert_before => 'div#existing-customer',
                     :sequence => {:after => 'replace_checkout_registration'},
                     :partial => 'spree/shared/social_users')
