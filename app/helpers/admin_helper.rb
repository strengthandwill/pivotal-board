module AdminHelper
  def admin?(person)
    !person.admin == nil? && person.admin == true
  end
end
