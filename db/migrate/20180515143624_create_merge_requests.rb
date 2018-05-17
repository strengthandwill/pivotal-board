class CreateMergeRequests < ActiveRecord::Migration
  def change
    create_table :merge_requests do |t|
      t.string :project_name
      t.string :title
      t.string :description
      t.string :url
      t.integer :started_time
      t.string :state
    end
  end
end
