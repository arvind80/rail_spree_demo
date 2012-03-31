class ChangeTaxonsToNestedSet < ActiveRecord::Migration
  def self.up
    add_column :taxons, :lft, :integer
    add_column :taxons, :rgt, :integer

    #Taxon.reset_column_information # So the new root ids get saved

    
  end

  def self.down
    remove_column :taxons, :lft
    remove_column :taxons, :rgt
  end
end
