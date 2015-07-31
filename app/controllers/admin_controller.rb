class AdminController < ApplicationController
  include PivotalApiHelper
  def index
    @people = Person.all
  end
  
  def reload
    people
    redirect_to action: :index
  end
end