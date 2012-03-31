Deface::Override.new(:virtual_path => 'spree/checkout/registration',
                     :name => 'add_hr_after_social_to_checkout_registration',
                     :insert_after => 'div#social_login',
                     :sequence => {:after => 'add_social_to_checkout_registration'},
                     :text => '<hr/>', :disabled => false)
