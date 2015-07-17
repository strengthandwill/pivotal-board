class PairingController < ApplicationController
  def index
    @team = team_param
    @members_image_url = members_image_url
  end

  def members_image_url
    members = ["jia-rong", "chong-yun-long", "wei-jie", "mvrkrishna-verma", "niladri-ghosh"]
    members.collect do |member|
      "#{ENV["people_images_dir_url"]}/#{member.downcase.gsub(' ', '-')}.png"
    end
  end
end
