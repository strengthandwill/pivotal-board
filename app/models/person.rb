class Person < ActiveRecord::Base
  include ImagesHelper
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def initialize(attributes = {})
    super(person_id:             attributes["id"],
          username:              attributes["username"],
          name:                  attributes["name"],
          image_path:            person_image_path(attributes["name"]), 
          email:                 attributes["email"],
          password:              ENV["default_password"],
          password_confirmation: ENV["default_password"])
  end
end