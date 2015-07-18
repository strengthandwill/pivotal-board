class PairingController < ApplicationController
  def index
    @team = team_param
    @members = members
    @stamps = 4
  end

  def members
    members = ["jia-rong", "chong-yun-long", "wei-jie", "mvrkrishna-verma", "niladri-ghosh",
              "yew-lee-goh", "dong-yang-zi", "vadivelan-kuppusamy", "singaravadivelan"]
  end
end
