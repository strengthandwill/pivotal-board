class AddMergeRequestsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :merge_requests, :boolean, default: false
  end
end
