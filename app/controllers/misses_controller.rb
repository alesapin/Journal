class MissesController < ApplicationController
  before_action :set_miss, only: [:show, :edit, :update, :destroy]

  # GET /misses
  # GET /misses.json
  def index
    @misses = Miss.all
  end

  # GET /misses/1
  # GET /misses/1.json
  def show
  end

  # GET /misses/new
  def new
    @miss = Miss.new
  end

  # GET /misses/1/edit
  def edit
  end

  # POST /misses
  # POST /misses.json
  def create
    @miss = Miss.new(miss_params)

    respond_to do |format|
      if @miss.save
        format.html { redirect_to @miss, notice: 'Miss was successfully created.' }
        format.json { render action: 'show', status: :created, location: @miss }
      else
        format.html { render action: 'new' }
        format.json { render json: @miss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /misses/1
  # PATCH/PUT /misses/1.json
  def update
    respond_to do |format|
      if @miss.update(miss_params)
        format.html { redirect_to @miss, notice: 'Miss was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @miss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /misses/1
  # DELETE /misses/1.json
  def destroy
    @miss.destroy
    respond_to do |format|
      format.html { redirect_to misses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miss
      @miss = Miss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miss_params
      params.require(:miss).permit(:student_id, :pair, :hours)
    end
end
