module ApplicationHelper
	def random_user
  	@random_user ||= User.find_by(id: session[:user_id])
  end

  def set_random_user
  	unless random_user
  		user = User.create_random_user
  		session[:user_id] = user.id
  	end
  end
end
