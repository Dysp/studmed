class IllnessesController < ApplicationController
  before_action :set_illness, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "<span class='lead' style='font-size: medium;'>Forsiden</span>".html_safe, :root_path

  CATEGORIES = ['Tema A', 'Tema B', 'Tema C', 'Tema D', 'Tema E', 'Tema F', 'Tema G', 'Tema H', 'Tema I', 'Tema J', 'Tema K']

  # GET /illnesses
  def index
    @illnesses = Illness.all
  end

  # GET /illness/1
  def show
    add_breadcrumb "<span class='lead' style='font-size: medium;'>#{@illness.name}</span>".html_safe, :illness_path
    @test = @illness.paraclinical.test
  end

  # GET /illness/new
  def new
    add_breadcrumb "<span class='lead' style='font-size: medium;'>Opret ny sygdom</span>".html_safe
    @illness = Illness.new
    @illness.clinical = Clinical.new(illness_id: @illness.id)
    @illness.paraclinical = Paraclinical.new(illness_id: @illness.id)
    @illness.paraclinical.test = Test.new(paraclinical_id: @illness.paraclinical.id)

    @differential_diagnoses = get_differential_diagnoses
    @categories = CATEGORIES
  end

  # GET /illness/1/edit
  def edit
    add_breadcrumb "<span class='lead' style='font-size: medium;'>Ændr sygdom</span>".html_safe
    @differential_diagnoses = get_differential_diagnoses
    @differential = @illness.differentials.build(:differential_id => params[:differential_id])
    @categories = CATEGORIES
  end

  # POST /illness
  def create
    @illness = Illness.new(illness_params)
    respond_to do |format|
      if @illness.save
        unless params[:differential_id].nil?
          params[:differential_id].each do |diff|
            save_differential(diff)
          end
        end
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
    # TODO: Den opretter ny differential i stedet for at redigere den allerede eksisterende.
    #@differential = @illness.differentials.build(:differential_id => params[:differential_id])
    respond_to do |format|
      if @illness.update(illness_params)
        #if params[:differential_id].each do |diff|
        #  save_differential(diff)
        #end
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
      params.require(:illness).permit(:name, :description, :synonyms, :etio_and_pato, :incidence, :prevalence, :category, :blood_sample, :differential_id,
                                    clinical_attributes: [:id, :anamnesis, :inspection, :palpation, :percussion, :auscultation, :_destroy],
                                    paraclinical_attributes: [:id, :biopsy, :lfu, :ekg, :_destroy,
                                                              test_attributes: [:id, :xray, :mri, :ct, :pet, :pet_mri, :ultrasound, :_destroy]])
    end

    def get_differential_diagnoses
      tema_a = Illness.where(category: CATEGORIES[0])
      tema_b = Illness.where(category: CATEGORIES[1])
      differential_diagnoses = []
      tema_a.collect { |x| differential_diagnoses << x}
      tema_b.collect { |x| differential_diagnoses << x}
      differential_diagnoses

      #!!!!! LAv motherfucking "relation" om til array af name og id som akn sendes til select_tag i view
    end

    def save_differential(diff)
      differential = @illness.differentials.build(:differential_id => diff)
      differential.save
    end

end
