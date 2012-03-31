class FixByPopularity < ActiveRecord::Migration
  class ProductScope < ActiveRecord::Base
		
  end
  
  def self.up
    ProductScope.update_all("name='descend_by_popularity'", "name='by_popularity'")
  end

  def self.down
  end
end
