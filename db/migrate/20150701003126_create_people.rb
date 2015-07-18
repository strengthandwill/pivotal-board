class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :person_id
      t.string  :name
      t.string  :image_path

      t.timestamps null: false
    end
  end
end
