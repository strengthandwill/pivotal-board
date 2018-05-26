class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :path
      t.string :project_name
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
