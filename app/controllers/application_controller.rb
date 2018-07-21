class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_random_user
  helper_method :random_user

  protected

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
