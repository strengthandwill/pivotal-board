class Setting < ActiveRecord::Base
  validates :unstarted_color, presence: true
  validates :started_color,   presence: true
  validates :finished_color,  presence: true
  validates :delivered_color, presence: true
  validates :impeded_color,   presence: true
  validates :accepted_color,  presence: true
  validates :feature_color,   presence: true
  validates :chore_color,     presence: true
  validates :bug_color,       presence: true
  validates :retro_color,     presence: true
  validates :interval,        presence: true
end
