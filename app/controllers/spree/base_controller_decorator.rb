Spree::BaseController.class_eval do
  before_filter :load_root_taxons

  
    def load_root_taxons
      @taxons ||= Spree::Taxonomy.where(:name => "Categories").first
    end

end
