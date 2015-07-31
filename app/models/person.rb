class Person < ActiveRecord::Base
  include ImagesHelper
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, 
  :rememberable, :trackable, :validatable
  
  def set_params(params = {})
    update_attributes(person_id:             params["id"],
                      username:              params["username"],
                      name:                  params["name"],
                      email:                 params["email"],
                      password:              ENV["default_password"],
                      password_confirmation: ENV["default_password"],
                      image_path:            person_image_path(params["name"]))
  end
end