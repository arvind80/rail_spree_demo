Spree::Image.attachment_definitions[:attachment][:styles] = { :mini => '48x48>', :small => '150x120>', :product => '240x240>', :large => '600x600>' }
Spree::Image.attachment_definitions[:attachment][:storage] = :s3
Spree::Image.attachment_definitions[:attachment][:s3_credentials] = S3_CREDENTIALS
Spree::Image.attachment_definitions[:attachment][:bucket] = "railsdog-radio"
Spree::Image.attachment_definitions[:attachment][:path] = ":attachment/:id/:style/:basename.:extension"
Spree::Image.attachment_definitions[:attachment][:s3_headers] = {'Cache-Control' => 'max-age=31557600'}
Spree::Image.attachment_definitions[:attachment][:default_url] = "/images/noimage/:style.png"
Spree::Image.attachment_definitions[:attachment].delete :url
