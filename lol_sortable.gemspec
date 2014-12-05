$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lol_sortable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lol_sortable"
  s.version     = LolSortable::VERSION
  s.authors     = ["Eduardo Zaghi"]
  s.email       = ["eduardo@loldesign.com.br"]
  s.homepage    = "http://www.loldesign.com.br"
  s.summary     = "Sort your models with jquery sortable"
  s.description = "Sort yours models with mongoid or active_record, jquery.ui.sortable"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "> 3.2"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"

  s.add_development_dependency "sqlite3"
end
