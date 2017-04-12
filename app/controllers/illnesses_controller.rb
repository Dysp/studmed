class IllnessesController < ApplicationController
  before_action :set_illness, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "<span class='lead' style='font-size: medium;'>Forsiden</span>".html_safe, :root_path

  def category
    add_breadcrumb "<span class='lead' style='font-size: medium;'>#{params[:category]}</span>".html_safe

    @categories = Illness.where(category: params[:category]).order('name ASC')
    @category = params[:category]
    if @categories.empty?
      redirect_to root_path, alert: "#{params[:category]} er desværre tom. Kig igen senere eller skriv til mig @ gjt439 for at få adgang til at tilføje sygdomme."
    end
  end
  # GET /illnesses
  def index
    @new_illnesses = Illness.order('created_at').last(5).reverse
    @counter = 0
  end

  # GET /illness/1
  def show
    add_breadcrumb "<span class='lead' style='font-size: medium;'>#{@illness.name}</span>".html_safe, :illness_path

    inelligible_illnesses_ids = @illness.differentials.all.map do |differential|
      differential.differential.id
    end
    inelligible_illnesses_ids << @illness.id

    @other_illnesses = Illness.where.not(id: inelligible_illnesses_ids)
    if @illness.symptoms.nil?
      @symptoms = 'Ingen angivne symptomer'
    else
      @symptoms = @illness.symptoms
    end
  end

  # GET /illness/new
  def new
    add_breadcrumb "<span class='lead' style='font-size: medium;'>Opret ny sygdom</span>".html_safe

    @illness = Illness.new
    @differential_diagnoses = get_differential_diagnoses
    @category_array = []
    @category_names.each_key {|key| @category_array << key}
  end

  # GET /illness/1/edit
  def edit
    add_breadcrumb "<span class='lead' style='font-size: medium;'>Ændr sygdom</span>".html_safe

    @differential_diagnoses = get_differential_diagnoses
    @differential = @illness.differentials.build(:differential_id => params[:differential_id])
    @category_array = []
    @category_names.each_key {|key| @category_array << key}
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
      params.require(:illness).permit(:name,
                                      :etio_and_pato,
                                      :incidence,
                                      :category,
                                      :name,
                                      :description,
                                      :synonyms,
                                      :treatment,
                                      :symptoms,
                                      :paraclinical,
                                      :differential_id)
    end

    def get_differential_diagnoses
      differential_diagnoses = []
      CATEGORIES.each do |category|
        differential_diagnoses << Illness.where(category: category)
      end
      differential_diagnoses.flatten!
    end

    def save_differential(diff)
      differential = @illness.differentials.build(:differential_id => diff)
      differential.save
    end
end
