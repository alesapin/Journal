class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:index,:show]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @all_subjs=all_subjects
    @summary=@all_subjs.inject(0) { |sum,tuple| sum+=tuple[1]}
    @all_subjs.each do |tuple|
      tuple[1]=Float(tuple[1])/@summary
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
	subj_ids=params[:subject_ids]
	subj_ids.each do |subj_id|
		s=Subject.find(subj_id)
		s.groups << @group
	end
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
	subj_ids=params[:subject_ids]
	@group.subjects.clear
	subj_ids.each do |subj_id|
		s=Subject.find(subj_id)
		s.groups << @group
	end
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def all_subjects
      @all_subjs = Hash.new
      @group.subjects.each do |subj|
        @all_subjs[subj.title]=0;
      end
      Pair.where("group_id = #{@group.id}").each do |pair|
          @all_subjs[pair.subject.title]+=2
      end
      @all_subjs.sort_by {|k,v| -v}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :course, :number_of_students)
    end
end
