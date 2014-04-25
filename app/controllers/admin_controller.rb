class AdminController < ApplicationController
  def index
	@teacher=Teacher.find(session[:teacher_id])
	@subjects=@teacher.subjects
	@groups=Array.new
	@subjects.each do |subject|
		@groups.concat(subject.groups.to_a)
	end
  end

  def logout
	session.destroy
  end
end
