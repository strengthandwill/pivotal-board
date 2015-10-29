class Story
  include ActiveModel::Model
  include ImagesHelper
  
  attr_accessor :kind, :id, :project_id, :name, :description, :story_type, :current_state, 
                :estimate, :accepted_at, :requested_by_id, :owned_by_id, :owner_ids, :labels, 
                :created_at, :updated_at, :url, :owners, :deadline
  
  def initialize(options = {})
    super(options)
    self.story_type = "retro" if include_label?("retrospective?")
    self.name = self.name.gsub('Grant', 'Gundam')
    self.name = self.name.gsub('Applicant', 'Pilot')
    self.name = self.name.gsub('applicant', 'pilot')
    self.name = self.name.gsub('fill in', 'pilot')
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

  def include_label?(label)
    !labels.nil? && labels.to_s.include?(label)
  end
end