class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
	teacher = Teacher.find_by(login: params[:login])
	if teacher and teacher.authenticate(params[:password])
		session[:teacher_id] = teacher.id
		redirect_to "/admin/index"
    else
		redirect_to login_url, alert: "Uncorrect password and/or login"
	end
  end

  def destroy
	session[:teacher_id] = nil
	redirect_to "/main", notice: "Logged out"
  end
end
