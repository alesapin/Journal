class SubjectsController < ApplicationController
  skip_before_action :authorize, only: [ :show, :index,:student_statistics]
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  Misc = Struct.new(:date,:hour)
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
	teacher_ids=params[:teacher_ids]
	teacher_ids.each do |teacher|
		t=Teacher.find(teacher)
		t.subjects << @subject
	end
    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subject }
      else
        format.html { render action: 'new' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
	teacher_ids=params[:teacher_ids]
	@subject.teachers.clear
	teacher_ids.each do |teacher|
		t=Teacher.find(teacher)
		t.subjects << @subject
	end
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  def student_statistics
	@subj=Subject.find(params[:subject_id])
	@stud=Student.find(params[:student_id])
	@pairs=@subj.pairs.where("group_id = #{@stud.group.id}")
	@to_print = Array.new
	@pairs.each do |pair|
		pair.misses.where(" student_id = #{@stud.id}").each do |m|
			@to_print << Misc.new(pair.today,m.hours)
		end
	end
	
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:title, :teacher, :img)
    end
end
