#endoding: utf-8
module LolSortable
  class AddModelGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    argument :model_name, :required => true, :default => nil

    def create_migration_to_model
      run "bundle exec rails g active_record:migration AddPriorityTo#{model_name.camelize} priority:integer"
    end

  end
end