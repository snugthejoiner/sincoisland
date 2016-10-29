class CountiesController < ApplicationController

  def show
    @state = State.find(params[:state_id])
    @county = County.find(params[:id])
  end

  def new
    @state = State.find(params[:state_id])
    @county = County.new
  end

  def create
    @county = County.new(county_params)
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

  def edit
    @state = State.find(params[:state_id])
    @county = County.find(params[:id])
  end

  def update
    @state = State.find(params[:state_id])
    @county = County.find(params[:id])
    @county.assign_attributes(county_params)
    @county.state_id = params[:county][:state_id]  

    if @county.save
      flash[:notice] = 'County was updated successfully.'
      redirect_to [@state, @county]
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
 
   def county_params
    params.require(:county).permit(:name, :population, :note)
   end

 end
