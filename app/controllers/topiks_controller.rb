class TopiksController < ApplicationController
  before_action :set_topik, only: [:show, :edit, :update, :destroy]

  # GET /topiks
  # GET /topiks.json
  def index
    @topiks = Topik.all
  end

  # GET /topiks/1
  # GET /topiks/1.json
  def show
  end

  # GET /topiks/new
  def new
    @topik = Topik.new
  end

  # GET /topiks/1/edit
  def edit
  end

  # POST /topiks
  # POST /topiks.json
  def create
    @topik = Topik.new(topik_params)

    respond_to do |format|
      if @topik.save
        format.html { redirect_to @topik, notice: 'Topik was successfully created.' }
        format.json { render :show, status: :created, location: @topik }
      else
        format.html { render :new }
        format.json { render json: @topik.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topiks/1
  # PATCH/PUT /topiks/1.json
  def update
    respond_to do |format|
      if @topik.update(topik_params)
        format.html { redirect_to @topik, notice: 'Topik was successfully updated.' }
        format.json { render :show, status: :ok, location: @topik }
      else
        format.html { render :edit }
        format.json { render json: @topik.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topiks/1
  # DELETE /topiks/1.json
  def destroy
    @topik.destroy
    respond_to do |format|
      format.html { redirect_to topiks_url, notice: 'Topik was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topik
      @topik = Topik.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topik_params
      params.require(:topik).permit(:nama)
    end
end
