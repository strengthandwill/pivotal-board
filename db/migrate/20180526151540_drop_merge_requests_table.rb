class DropMergeRequestsTable < ActiveRecord::Migration
  def up
    drop_table :merge_requests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
