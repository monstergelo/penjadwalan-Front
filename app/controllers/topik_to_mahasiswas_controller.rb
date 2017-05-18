class TopikToMahasiswasController < ApplicationController
  before_action :set_topik_to_mahasiswa, only: [:show, :edit, :update, :destroy]

  # GET /topik_to_mahasiswas
  # GET /topik_to_mahasiswas.json
  def index
    @topik_to_mahasiswas = TopikToMahasiswa.all
  end

  # GET /topik_to_mahasiswas/1
  # GET /topik_to_mahasiswas/1.json
  def show
  end

  # GET /topik_to_mahasiswas/new
  def new
    @topik_to_mahasiswa = TopikToMahasiswa.new
  end

  # GET /topik_to_mahasiswas/1/edit
  def edit
  end

  # POST /topik_to_mahasiswas
  # POST /topik_to_mahasiswas.json
  def create
    @topik_to_mahasiswa = TopikToMahasiswa.new(topik_to_mahasiswa_params)

    respond_to do |format|
      if @topik_to_mahasiswa.save
        format.html { redirect_to @topik_to_mahasiswa, notice: 'Topik to mahasiswa was successfully created.' }
        format.json { render :show, status: :created, location: @topik_to_mahasiswa }
      else
        format.html { render :new }
        format.json { render json: @topik_to_mahasiswa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topik_to_mahasiswas/1
  # PATCH/PUT /topik_to_mahasiswas/1.json
  def update
    respond_to do |format|
      if @topik_to_mahasiswa.update(topik_to_mahasiswa_params)
        format.html { redirect_to @topik_to_mahasiswa, notice: 'Topik to mahasiswa was successfully updated.' }
        format.json { render :show, status: :ok, location: @topik_to_mahasiswa }
      else
        format.html { render :edit }
        format.json { render json: @topik_to_mahasiswa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topik_to_mahasiswas/1
  # DELETE /topik_to_mahasiswas/1.json
  def destroy
    @topik_to_mahasiswa.destroy
    respond_to do |format|
      format.html { redirect_to topik_to_mahasiswas_url, notice: 'Topik to mahasiswa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topik_to_mahasiswa
      @topik_to_mahasiswa = TopikToMahasiswa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topik_to_mahasiswa_params
      params.require(:topik_to_mahasiswa).permit(:topik_id, :mahasiswa_id)
    end
end
