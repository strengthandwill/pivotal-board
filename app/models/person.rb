class Person < ActiveRecord::Base
  def initialize(attributes = {})
    super(id: attributes["id"], name: attributes["name"])
  end
end