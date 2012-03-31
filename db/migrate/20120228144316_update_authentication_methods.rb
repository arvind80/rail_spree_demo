class UpdateAuthenticationMethods < ActiveRecord::Migration
  def change
    change_table :spree_authentication_methods do |t|
      t.string :provider
      t.string :api_key
      t.string :api_secret
    end
  end
end
