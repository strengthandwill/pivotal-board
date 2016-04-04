class AddProjectIdToBurndowns < ActiveRecord::Migration
  def change
    add_column :burndowns, :project_id, :integer
  end
end
