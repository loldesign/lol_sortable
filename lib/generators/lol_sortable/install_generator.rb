#endoding: utf-8
module LolSortable
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def add_routes
      route "mount LolSortable::Engine => '/'"
    end

    def add_js_config
      inject_into_file 'app/assets/javascripts/application.js', after: "//= require jquery_ujs\n" do
        "//= require jquery.ui.sortable\n//= require lol_sortable/sortable"
      end
    end
  end
end