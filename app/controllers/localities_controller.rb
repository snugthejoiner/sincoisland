class LocalitiesController < ApplicationController

  def show
    @state = State.find(params[:state_id])
    @county = County.find(params[:county_id])
    @locality = Locality.find(params[:id])
  end

  def new
    @state = State.find(params[:state_id])
    @county = County.find(params[:county_id])
    @locality = Locality.new
  end

  def create
    @locality = Locality.new(locality_params)
    @state = State.find(params[:state_id])
    @county = County.find(params[:county_id])

    if @locality.save
      flash[:notice] = 'Locality was saved successfully.'
      redirect_to [@state, @county, @locality]
    else
      flash.now[:alert] = "There was an error saving the locality. Please try again."
      render :new
    end
  end

  def edit
    @state = State.find(params[:state_id])
    @county = County.find(params[:county_id])
    @locality = Locality.find(params[:id])
  end

  def update
    @state = State.find(params[:state_id])
    @county = County.find(params[:county_id])
    @locality = Locality.find(params[:id])
    @locality.assign_attributes(locality_params)
    @locality.county_id = params[:locality][:county_id]
 
     if @locality.save
       flash[:notice] = "Gobblegorf was updated successfully."
       redirect_to [@state, @county, @locality]
     else
       flash.now[:alert] = "There was an error saving this Gobblegorf. Please try again."
       render :edit
     end
   end

  def edit
    @locality = Locality.find(params[:id])
    @state = State.find(params[:state_id])
    @county = County.find(params[:county_id])
    @locality = Locality.find(params[:id])
  end

  def destroy
  end

  private

   def locality_params
    params.require(:locality).permit(:name, :population, :locality_type, :note)
   end

end
