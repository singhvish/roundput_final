class CircularInitiativesController < ApplicationController
  before_action :set_circular_initiative, only: [:show, :edit, :update, :destroy]

  # GET /circular_initiatives
  # GET /circular_initiatives.json
  def index
    @circular_initiatives = CircularInitiative.all
  end

  # GET /circular_initiatives/1
  # GET /circular_initiatives/1.json
  def show
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def circular_initiative_params
      params.require(:circular_initiative).permit(:Name_of_the_initiative, :Initiative_description, :Leading_organization, :Organization_sector, :Organization_type, :Website, :Primary_strategy, :Region, :Country, :City)
    end
end
