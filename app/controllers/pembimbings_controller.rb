class PembimbingsController < ApplicationController
  before_action :set_pembimbing, only: [:show, :edit, :update, :destroy]

  # GET /pembimbings
  # GET /pembimbings.json
  def index
    @pembimbings = Pembimbing.all
  end

  # GET /pembimbings/1
  # GET /pembimbings/1.json
  def show
  end

  # GET /pembimbings/new
  def new
    @pembimbing = Pembimbing.new
  end

  # GET /pembimbings/1/edit
  def edit
  end

  # POST /pembimbings
  # POST /pembimbings.json
  def create
    @pembimbing = Pembimbing.new(pembimbing_params)

    respond_to do |format|
      if @pembimbing.save
        format.html { redirect_to @pembimbing, notice: 'Pembimbing was successfully created.' }
        format.json { render :show, status: :created, location: @pembimbing }
      else
        format.html { render :new }
        format.json { render json: @pembimbing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pembimbings/1
  # PATCH/PUT /pembimbings/1.json
  def update
    respond_to do |format|
      if @pembimbing.update(pembimbing_params)
        format.html { redirect_to @pembimbing, notice: 'Pembimbing was successfully updated.' }
        format.json { render :show, status: :ok, location: @pembimbing }
      else
        format.html { render :edit }
        format.json { render json: @pembimbing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pembimbings/1
  # DELETE /pembimbings/1.json
  def destroy
    @pembimbing.destroy
    respond_to do |format|
      format.html { redirect_to pembimbings_url, notice: 'Pembimbing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pembimbing
      @pembimbing = Pembimbing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pembimbing_params
      params.require(:pembimbing).permit(:mahasiswa_id, :dosen_id)
    end
end
