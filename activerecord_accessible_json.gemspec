# frozen_string_literal: true
require_relative "lib/activerecord_accessible_json/version"

Gem::Specification.new do |spec|
  spec.name        = "activerecord_accessible_json"
  spec.version     = ActiverecordAccessibleJson::VERSION
  spec.authors     = ["Yamaguchi Takuya"]
  spec.email       = ["yamat47.thirddown@gmail.com"]
  spec.homepage    = "https://github.com/yamat47/activerecord_accessible_json"
  spec.summary     = "Make ActiveRecord's JSON attribute more accessible."
  spec.description = "Using this gem, ActiveRecord's JSON attribute is deserialized into not Hash but HashWithIndifferentAccess."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yamat47/activerecord_accessible_json"
  spec.metadata["changelog_uri"] = "https://github.com/yamat47/activerecord_accessible_json/blob/main/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "activerecord", ">= 5.2.0"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "rubocop-rspec"
end
