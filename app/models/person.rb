class Person < ActiveRecord::Base
  include ImagesHelper
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def initialize(params = {})
    super(person_id:             params["id"],
          username:              params["username"],
          name:                  params["name"],
          email:                 params["email"],
          password:              ENV["default_password"],
          password_confirmation: ENV["default_password"],
          image_path:            person_image_path(params["name"]))
  end
end