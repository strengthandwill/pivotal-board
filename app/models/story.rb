class Story
  include ActiveModel::Model
  include ImagesHelper
  
  attr_accessor :kind, :id, :project_id, :project_name, :name, :description, :story_type, :current_state, 
                :estimate, :accepted_at, :requested_by_id, :owned_by_id, :owner_ids, :labels, 
                :created_at, :updated_at, :url, :owners, :deadline

  attr_accessor  :story_id, :total_cycle_time, 
                 :started_time, :started_count, :started_days, 
                 :finished_time, :finished_count, 
                 :delivered_time, :delivered_count, 
                 :rejected_time, :rejected_count
  
  def initialize(options = {})
    super(options)
    self.story_type = "retro" if include_label?("retrospective?")
    self.started_time   = started_time.nil??   0: milliseconds_to_days(started_time)
    self.finished_time  = finished_time.nil??  0: milliseconds_to_days(finished_time) 
    self.delivered_time = delivered_time.nil?? 0: milliseconds_to_days(delivered_time)
    self.rejected_time  = rejected_time.nil??  0: milliseconds_to_days(rejected_time)
    # self.name = self.name.gsub('Grant', 'Gundam')
    # self.name = self.name.gsub('Applicant', 'Pilot')
    # self.name = self.name.gsub('applicant', 'pilot')
    # self.name = self.name.gsub('fill in', 'pilot')
    # self.name = self.name.gsub('MRA', 'Celestial Being')
    # self.name = self.name.gsub('CDG', 'Coordinator')
  end
  
  def owners
    @owners ||= []
  end
  
  def owners_name
    owners.collect { |owner| owner.name }.join(", ")
  end

  def owners_image
    owners.collect do |owner|
      person_image_path(owner.name)
    end
  end

  def state?(state)
    state.nil? || current_state==state
  end
  
  def team?(team)
    team.nil? || include_label?(team)
  end

  def retro?
    include_label?("retrospective?")
  end
  
  def rejected?
    state?("rejected")
  end

  def impeded?
    include_label?("impeded")
  end

  def ror?
    include_label?("ror")
  end

  def appian?
    include_label?("appian")
  end

  def deployed?
    include_label?("deployed")
  end  

  def include_label?(label)
    !labels.nil? && labels.to_s.include?(label)
  end
  
  def started_days
    self.started_time
  end
  
  # def project_name=(value)
  #   @project_name = value.split('-').last
  # end
  
  private
    def milliseconds_to_days(milliseconds)
      (milliseconds / 86400000.0).round(1)
    end
end