# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "active_shipping"
  s.version = "0.9.13"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["James MacAulay", "Tobi Lutke", "Cody Fauser", "Jimmy Baker"]
  s.date = "2011-04-27"
  s.description = "Get rates and tracking info from various shipping carriers."
  s.email = ["james@shopify.com"]
  s.homepage = "http://github.com/shopify/active_shipping"
  s.require_paths = ["lib"]
  s.rubyforge_project = "active_shipping"
  s.rubygems_version = "1.8.10"
  s.summary = "Shipping API extension for Active Merchant"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.5"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.5"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.5"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
