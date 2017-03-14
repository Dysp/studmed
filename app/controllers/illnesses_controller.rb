class IllnessesController < ApplicationController
  before_action :set_illness, only: [:show, :edit, :update, :destroy]

  # GET /illnesses
  def index
    @illnesses = Illness.all
  end

  # GET /illness/1
  def show
  end

  # GET /illness/new
  def new
    @illness = Illness.new
    @illness.clinical = Clinical.new(illness_id: @illness.id)
    @illness.paraclinical = Paraclinical.new(illness_id: @illness.id)
    @illness.paraclinical.test = Test.new(paraclinical_id: @illness.paraclinical.id)

    @categories = ['Tema D', 'Tema E', 'Whatever']
  end

  # GET /illness/1/edit
  def edit
  end

  # POST /illness
  def create
    @illness = Illness.new(illness_params)

    respond_to do |format|
      if @illness.save
        format.html { redirect_to @illness, notice: 'Illness was successfully created.' }
        format.json { render :show, status: :created, location: @illness }
      else
        format.html { render :new }
        format.json { render json: @illness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /illness/1
  def update
    respond_to do |format|
      if @illness.update(illness_params)
        format.html { redirect_to @illness, notice: 'Illness was successfully updated.' }
        format.json { render :show, status: :ok, location: @illness }
      else
        format.html { render :edit }
        format.json { render json: @illness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /illness/1
  def destroy
    @illness.destroy
    respond_to do |format|
      format.html { redirect_to illnesses_url, notice: 'Illness was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_illness
      @illness = Illness.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def illness_params
      params.require(:illness).permit(:name, :description, :etiology, :patogenesis, :incidence, :prevalence, :category, :anamnesis,
                                    clinical_attributes: [:id, :inspection, :palpation, :percussion, :auscultation, :_destroy],
                                    paraclinical_attributes: [:id, :biopsy, :lfu, :ekg, :_destroy, test_attributes: [:id, :xray, :_destroy]])
    end
end
