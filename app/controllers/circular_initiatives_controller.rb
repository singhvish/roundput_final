class CircularInitiativesController < ApplicationController
  before_action :set_circular_initiative, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :vote, :edit]
  before_action :check_user, only: [:new]

def home
  @newsletter = Newsletter.new
end

def import
  CircularInitiative.import(params[:file])
  redirect_to root_url, notice: "Circular Initiatives imported successfully."
end

def vote
  value = params[:type] == "up" ? 1 : -1
  @circular_initiative = CircularInitiative.find(params[:id])
  @circular_initiative.add_or_update_evaluation(:votes, value, current_user)
  redirect_to circular_initiative_path(@circular_initiative), notice: "Thank you for voting"
end

  # GET /circular_initiatives
  # GET /circular_initiatives.json
  def index
      query = params[:search].presence || "*"
      args = {}
      args[:Region] = params[:Region] if params[:Region].present?
      args[:Country] = params[:Country] if params[:Country].present?
      args[:Organization_type] = params[:Organization_type] if params[:Organization_type].present?
      args[:Organization_sector] = params[:Organization_sector] if params[:Organization_sector].present?
      args[:Primary_strategy] = params[:Primary_strategy] if params[:Primary_strategy].present?
      args[:address] = params[:address] if params[:address].present?
      @circular_initiatives = CircularInitiative.search query, where: args, aggs: {Region: {}, Country: {}, Organization_type: {}, Organization_sector: {}, Primary_strategy: {}, address:{} }, page: params[:page], per_page: 20
      @newsletter = Newsletter.new
  end

  # GET /circular_initiatives/1
  # GET /circular_initiatives/1.json
  def show
    @reviews = Review.where(circular_initiative_id: @circular_initiative.id).order("created_at DESC")
  end

  # GET /circular_initiatives/new
  def new
    @circular_initiative = CircularInitiative.new
  end

  # GET /circular_initiatives/1/edit
  def edit
  end

  # POST /circular_initiatives
  # POST /circular_initiatives.json
  def create
    @circular_initiative = CircularInitiative.new(circular_initiative_params)

    respond_to do |format|
      if @circular_initiative.save
        format.html { redirect_to @circular_initiative, notice: 'Circular initiative was successfully created.' }
        format.json { render :show, status: :created, location: @circular_initiative }
      else
        format.html { render :new }
        format.json { render json: @circular_initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circular_initiatives/1
  # PATCH/PUT /circular_initiatives/1.json
  def update
    respond_to do |format|
      if @circular_initiative.update(circular_initiative_params)
        format.html { redirect_to @circular_initiative, notice: 'Circular initiative was successfully updated.' }
        format.json { render :show, status: :ok, location: @circular_initiative }
      else
        format.html { render :edit }
        format.json { render json: @circular_initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circular_initiatives/1
  # DELETE /circular_initiatives/1.json
  def destroy
    @circular_initiative.destroy
    respond_to do |format|
      format.html { redirect_to circular_initiatives_url, notice: 'Circular initiative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circular_initiative
      @circular_initiative = CircularInitiative.find(params[:id])
    end

  def check_user
    unless current_user.admin?
    redirect_to root_url, alert: "Sorry, only admins can do that!"
    end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def circular_initiative_params
      params.require(:circular_initiative).permit(:Name_of_the_initiative, :Organization_sector, :Initiative_description, :Leading_organization, :Organization_type, :Organization_description, :Website, :Primary_strategy, :Region, :Country, :City, :address, :partners, :problem, :awards, :funding, :linkedin, :twitter, :facebook, :instagram, :video, :email)
    end
end
