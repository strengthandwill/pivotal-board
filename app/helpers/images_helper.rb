module ImagesHelper
  def person_image_path(person_name)
    default_image_path(person_name.downcase.gsub(' ', '-'))
  end
  
  def team_stamp_image_path(team)
    default_image_path(team)
  end
  
  private
    def default_image_path(image)
      "#{ENV["default_images_url"]}/#{image}.png"
    end
end