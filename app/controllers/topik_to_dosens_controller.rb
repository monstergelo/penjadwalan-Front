class TopikToDosensController < ApplicationController
  before_action :set_topik_to_dosen, only: [:show, :edit, :update, :destroy]

  # GET /topik_to_dosens
  # GET /topik_to_dosens.json
  def index
    @topik_to_dosens = TopikToDosen.all
  end

  # GET /topik_to_dosens/1
  # GET /topik_to_dosens/1.json
  def show
  end

  # GET /topik_to_dosens/new
  def new
    @topik_to_dosen = TopikToDosen.new
  end

  # GET /topik_to_dosens/1/edit
  def edit
  end

  # POST /topik_to_dosens
  # POST /topik_to_dosens.json
  def create
    @topik_to_dosen = TopikToDosen.new(topik_to_dosen_params)

    respond_to do |format|
      if @topik_to_dosen.save
        format.html { redirect_to @topik_to_dosen, notice: 'Topik to dosen was successfully created.' }
        format.json { render :show, status: :created, location: @topik_to_dosen }
      else
        format.html { render :new }
        format.json { render json: @topik_to_dosen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topik_to_dosens/1
  # PATCH/PUT /topik_to_dosens/1.json
  def update
    respond_to do |format|
      if @topik_to_dosen.update(topik_to_dosen_params)
        format.html { redirect_to @topik_to_dosen, notice: 'Topik to dosen was successfully updated.' }
        format.json { render :show, status: :ok, location: @topik_to_dosen }
      else
        format.html { render :edit }
        format.json { render json: @topik_to_dosen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topik_to_dosens/1
  # DELETE /topik_to_dosens/1.json
  def destroy
    @topik_to_dosen.destroy
    respond_to do |format|
      format.html { redirect_to topik_to_dosens_url, notice: 'Topik to dosen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topik_to_dosen
      @topik_to_dosen = TopikToDosen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topik_to_dosen_params
      params.require(:topik_to_dosen).permit(:topik_id, :dosen_id)
    end
end
