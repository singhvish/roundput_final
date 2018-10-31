class CircularInitiativesController < ApplicationController
  before_action :set_circular_initiative, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:create,:show, :index, :search]
  #before_action :check_user, except: [:index, :show, :create, :search]

def home
end

def search
  if params[:search].present?
    @circular_initiatives = CircularInitiative.search(params[:search], page: params[:page], per_page: 10)
  else
    @circular_initiatives = CircularInitiative.all.paginate(:page =>params[:page], :per_page =>10)
  end
end

  # GET /circular_initiatives
  # GET /circular_initiatives.json
  def index
    @circular_initiatives = CircularInitiative.all.paginate(:page =>params[:page], :per_page =>10)
    @circular_initiatives = @circular_initiatives.where(Region: params["Region"]) if params["Region"].present?
    @circular_initiatives = @circular_initiatives.where(Country: params["Country"]) if params["Country"].present?
    @circular_initiatives = @circular_initiatives.where(Organization_type: params["Organization_type"]) if params["Organization_type"].present?
    @circular_initiatives = @circular_initiatives.where(sector_id: params["sector_id"]) if params["sector_id"].present?
    
  end

  # GET /circular_initiatives/1
  # GET /circular_initiatives/1.json
  def show
    @reviews = Review.where(circular_initiative_id: @circular_initiative.id)
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

   # def check_user
    #  unless current_user.admin?
    #    redirect_to root_url, alert: "Sorry, only admins can do that!"
   #   end
   # end


    # Never trust parameters from the scary internet, only allow the white list through.
    def circular_initiative_params
      params.require(:circular_initiative).permit(:Name_of_the_initiative, :sector_id, :Initiative_description, :Leading_organization, :Organization_type, :Website, :Primary_strategy, :Region, :Country, :City, :address)
    end
end
