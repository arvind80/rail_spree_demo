Spree::Taxon.attachment_definitions[:icon][:styles] = { :mini => '32x32>', :normal => '140x82>', :large => '661x-1' }
Spree::Taxon.attachment_definitions[:icon][:storage] = :s3
Spree::Taxon.attachment_definitions[:icon][:s3_credentials] = "#{Rails.root}/config/s3.yml"
Spree::Taxon.attachment_definitions[:icon][:bucket] = "spree"
Spree::Taxon.attachment_definitions[:icon][:path] = "taxons/:id/:style/:basename.:extension"
Spree::Taxon.attachment_definitions[:icon][:s3_headers] = {'Cache-Control' => 'max-age=31557600'}
Spree::Taxon.attachment_definitions[:icon].delete :url
