class AddDescriptionToTaxons < ActiveRecord::Migration
    class Taxon < ActiveRecord::Base
		
	end
    def self.up
      # skip this migration if the attribute already exists because of advanced taxon extension
      return if Taxon.new.respond_to? :description
      add_column :taxons, :description, :text
    end

    def self.down
      remove_column :taxons, :description
    end
end
