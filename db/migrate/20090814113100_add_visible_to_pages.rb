class AddVisibleToPages < ActiveRecord::Migration

  class Page < ActiveRecord::Base
  end
  
  def self.up
    Page.update_all :visible => true 
  end
 
  def self.down
    remove_column :pages, :visible
  end
  
end
