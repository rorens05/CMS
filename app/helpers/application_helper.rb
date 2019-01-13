module ApplicationHelper

  def format_name(firstname, middlename, lastname)
    firstname + " " + middlename.chars.first + ". " + lastname
  end
end
