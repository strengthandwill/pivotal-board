class CreateBurndowns < ActiveRecord::Migration
  def change
    create_table :burndowns do |t|
      t.string  :team
      t.date    :date
      t.integer :unstarted
      t.integer :started
      t.integer :finished
      t.integer :delivered
      t.string  :accepted

      t.timestamps null: false
    end
  end
end
