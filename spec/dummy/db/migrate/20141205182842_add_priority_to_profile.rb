class AddPriorityToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :priority, :integer
  end
end
