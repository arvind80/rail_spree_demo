class AddRrpToProduct < ActiveRecord::Migration
  class Product < ActiveRecord::Base
		
  end
  def self.up
    add_column :products, :rrp, :decimal, :precision => 8, :scale => 2

    Product.reset_column_information
    Product.all.each {|p| p.update_attribute(:rrp, ((p.price * 0.1).round + p.price))  }
  end

  def self.down
    remove_column :products, :rrp
  end
end
