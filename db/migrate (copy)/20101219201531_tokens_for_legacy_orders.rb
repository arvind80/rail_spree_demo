class TokensForLegacyOrders < ActiveRecord::Migration
  class Order < ActiveRecord::Base
		
  end
  def self.up
    # add token permissions for legacy orders (stop relying on user persistence token)
    Order.all.each do |order|
      next unless order.user
      order.create_tokenized_permission(:token => order.user.persistence_token)
    end
  end

  def self.down
  end
end
