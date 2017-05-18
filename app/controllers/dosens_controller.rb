class DosensController < ApplicationController
  before_action :set_dosen, only: [:show, :edit, :update, :destroy]

  # GET /dosens
  # GET /dosens.json
  def index
    @dosens = Dosen.all
  end

  # GET /dosens/1
  # GET /dosens/1.json
  def show
  end

  # GET /dosens/new
  def new
    @dosen = Dosen.new
  end

  # GET /dosens/1/edit
  def edit
  end

  # POST /dosens
  # POST /dosens.json
  def create
    @dosen = Dosen.new(dosen_params)

    respond_to do |format|
      if @dosen.save
        format.html { redirect_to @dosen, notice: 'Dosen was successfully created.' }
        format.json { render :show, status: :created, location: @dosen }
      else
        format.html { render :new }
        format.json { render json: @dosen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dosens/1
  # PATCH/PUT /dosens/1.json
  def update
    respond_to do |format|
      if @dosen.update(dosen_params)
        format.html { redirect_to @dosen, notice: 'Dosen was successfully updated.' }
        format.json { render :show, status: :ok, location: @dosen }
      else
        format.html { render :edit }
        format.json { render json: @dosen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dosens/1
  # DELETE /dosens/1.json
  def destroy
    @dosen.destroy
    respond_to do |format|
      format.html { redirect_to dosens_url, notice: 'Dosen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dosen
      @dosen = Dosen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dosen_params
      params.require(:dosen).permit(:NIP, :nama, :email)
    end
end
