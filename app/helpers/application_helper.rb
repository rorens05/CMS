module ApplicationHelper

  def format_name(firstname, middlename, lastname)
    firstname 
  end

  def verify_image(image)
    if image.attachment
      return image
    else
      return '/images/cslogo.png'
    end
  end
end
