require 'spree/core/preference_rescue'

class NamespaceSpreeSocialTables < ActiveRecord::Migration
  class Spree::AuthenticationMethod < ActiveRecord::Base
    preference :api_secret, :string
    preference :api_key, :string
    preference :provider, :string
  end
  def change
    rename_table :user_authentications,   :spree_user_authentications
    rename_table :authentication_methods, :spree_authentication_methods

    Spree::PreferenceRescue.try
  end
end
