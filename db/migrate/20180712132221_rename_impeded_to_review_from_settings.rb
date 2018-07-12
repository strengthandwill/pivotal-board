class RenameImpededToReviewFromSettings < ActiveRecord::Migration
  def change
    rename_column :settings, :impeded_color, :review_color
  end
end
