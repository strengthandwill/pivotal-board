class DropBurndownsTable < ActiveRecord::Migration
  def up
    drop_table :burndowns
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
