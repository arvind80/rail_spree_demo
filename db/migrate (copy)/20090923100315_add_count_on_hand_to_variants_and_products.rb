class AddCountOnHandToVariantsAndProducts < ActiveRecord::Migration
  def self.up
    add_column :variants, :count_on_hand, :integer, :default => 0, :null => false
    add_column :products, :count_on_hand, :integer, :default => 0, :null => false

    # In some cases needed to reflect changes in table structure
    #Variant.reset_column_information
    #Product.reset_column_information

    
    
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
