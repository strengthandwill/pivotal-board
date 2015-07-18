module ImagesHelper
  def owner_image(owner_name)
    image(owner_name.downcase.gsub(' ', '-'))
  end
  
  def team_stamp_image(team)
    team = "ojiisan-obasan"
    image(team)
  end
  
  private
    def image(image)
      "#{ENV["people_images_dir_url"]}/#{image}.png"
    end
end