class AddProjectIdsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :project_ids, :string
  end
end
