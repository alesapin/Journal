class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize
  protect_from_forgery with: :exception

  protected
	def authorize
		unless Teacher.find_by(id: session[:teacher_id])
		redirect_to login_url,notice: "Authenticate"
	end
  end
end
