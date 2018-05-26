class Account < ActiveRecord::Base
  validates :name, presence: true
  validates :path, presence: true
  validates :project_name, presence: true
  validates :project_ids, presence: true
end
