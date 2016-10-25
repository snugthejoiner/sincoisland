class CountiesController < ApplicationController
  before_action :set_county, only: [:show, :edit, :update, :destroy]

  # GET /counties/1
  # GET /counties/1.json
  def show
    @state = State.find(params[:state_id])
    @county = County.find(params[:id])
  end

  # GET /counties/new
  def new
    @state = State.find(params[:state_id])
    @county = County.new
  end

  # GET /counties/1/edit
  def edit
    @state = State.find(params[:state_id])
    @county = County.find(params[:id])
  end
  
  # POST /counties
  # POST /counties.json
  def create
    @county = County.new
    @county.name = params[:county][:name]
    @county.population = params[:county][:population]
    @county.note = params[:county][:note]
    @state = State.find(params[:state_id])
    @county.state = @state

    if @county.save
      flash[:notice] = 'County was saved successfully.'
      redirect_to [@state, @county]
    else
      flash.now[:alert] = "There was an error saving the county. Please try again."
      render :new
    end
  end

  def update
    @county = County.find(params[:id])
    @county.name = params[:county][:name]
    @county.population = params[:county][:population]
    @county.note = params[:county][:note]
    @county.state_id = params[:county][:state_id]  

    if @county.save
      flash[:notice] = 'County was updated successfully.'
      redirect_to @county.state
    else
      flash.now[:alert] = "There was an error updating the county. Please try again."
      render :new
    end
  end

  def destroy
    @state = State.find(params[:state_id])
    @county = County.find(params[:id])
 
     if @county.destroy
       flash[:notice] = "\"#{@county.name}\" was deleted successfully."
       redirect_to @county.state
     else
       flash.now[:alert] = "There was an error deleting the county."
       render :show
     end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_county
      @county = County.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def county_params
      params[:county]
    end
end
