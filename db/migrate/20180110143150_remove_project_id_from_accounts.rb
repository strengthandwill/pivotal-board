class RemoveProjectIdFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :project_id, :string
  end
end
