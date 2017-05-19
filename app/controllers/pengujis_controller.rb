class PengujisController < ApplicationController
  before_action :set_penguji, only: [:show, :edit, :update, :destroy]

  # GET /pengujis
  # GET /pengujis.json
  def index
    @pengujis = Penguji.all
  end

  # GET /pengujis/1
  # GET /pengujis/1.json
  def show
  end

  # GET /pengujis/new
  def new
    @penguji = Penguji.new
  end

  # GET /pengujis/1/edit
  def edit
  end

  # POST /pengujis
  # POST /pengujis.json
  def create
    @penguji = Penguji.new(penguji_params)

    respond_to do |format|
      if @penguji.save
        format.html { redirect_to @penguji, notice: 'Penguji was successfully created.' }
        format.json { render :show, status: :created, location: @penguji }
      else
        format.html { render :new }
        format.json { render json: @penguji.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pengujis/1
  # PATCH/PUT /pengujis/1.json
  def update
    respond_to do |format|
      if @penguji.update(penguji_params)
        format.html { redirect_to @penguji, notice: 'Penguji was successfully updated.' }
        format.json { render :show, status: :ok, location: @penguji }
      else
        format.html { render :edit }
        format.json { render json: @penguji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pengujis/1
  # DELETE /pengujis/1.json
  def destroy
    @penguji.destroy
    respond_to do |format|
      format.html { redirect_to pengujis_url, notice: 'Penguji was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_penguji
      @penguji = Penguji.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def penguji_params
      params.require(:penguji).permit(:mahasiswa_id, :dosen_id)
    end
end
