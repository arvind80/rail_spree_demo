class AddCountOnHandToVariantsAndProducts < ActiveRecord::Migration
  class Variant < ActiveRecord::Migration
  end
  class Product < ActiveRecord::Migration
  end
  def self.up
    add_column :variants, :count_on_hand, :integer, :default => 0, :null => false
    add_column :products, :count_on_hand, :integer, :default => 0, :null => false

    # In some cases needed to reflect changes in table structure
    

    say_with_time 'Transfering inventory units with status on_hand to variants table...' do
      Variant.connection.execute("select * from variants").each do |v|
        v.update_attribute(:count_on_hand, v.inventory_units.with_state("on_hand").size)
        InventoryUnit.destroy_all(:variant_id => v.id, :state => "on_hand")
      end
    end

    say_with_time 'Updating products count on hand' do
       Product.connection.execute("select * from products").each do |p|
        product_count_on_hand = p.has_variants? ?
            p.variants.inject(0) {|acc, v| acc + v.count_on_hand} :
            (p.master ? p.master.count_on_hand : 0)
        p.update_attribute(:count_on_hand, product_count_on_hand)
      end
    end
  end

  def self.down
    Variant.all.each do |v|
      v.count_on_hand.times do
        InventoryUnit.create(:variant => variant, :state => 'on_hand')
      end
    end
    remove_column :variants, :count_on_hand
    remove_column :products, :count_on_hand
  end
end
