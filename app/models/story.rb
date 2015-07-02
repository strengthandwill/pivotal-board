class Story
  include ActiveModel::Model
  
  attr_accessor :kind, :id, :project_id, :name, :description, :story_type, :current_state, 
                :estimate, :accepted_at, :requested_by_id, :owned_by_id, :owner_ids, :labels, 
                :created_at, :updated_at, :url, :owners
  
  def owners
    @owners ||= []
  end
  
  def owners_by_name
    owners.collect { |owner| owner.name }.join(", ")
  end

  def state?(state)
    state.nil? || current_state==state
  end
  
  def team?(team)
    team.nil? || include_label?(team)
  end

  def appian?
    include_label?("appian")
  end

  def include_label?(label)
    !labels.nil? && labels.to_s.include?(label)
  end
end