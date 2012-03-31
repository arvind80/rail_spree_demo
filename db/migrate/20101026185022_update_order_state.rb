class UpdateOrderState < ActiveRecord::Migration
  class Order < ActiveRecord::Base
		
  end
  def self.up
    Order.all.map(&:update!)
  end

  def self.down
  end
end
