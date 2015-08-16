class DropColors < ActiveRecord::Migration
  def up
    drop_table :colors
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
