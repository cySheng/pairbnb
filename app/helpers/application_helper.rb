module ApplicationHelper
	def flash_class(level)
    case level
        when "notice" then "alert alert-info"
        when "success" then "alert alert-success"
        when "error" then "alert alert-error"
        when "alert" then "alert alert-error"
    end
	end

  def display_profile_image 
    if current_user.avatar?
      current_user.avatar.url
    else
      "profile.jpg"
    end
  end
end
