class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	include ApplicationHelper
  before_action :set_random_user
end
