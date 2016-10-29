class StatesController < ApplicationController
  
  def index
    @states = State.all
  end

  def show
    @state = State.find(params[:id])
  end

  def new
    @state = State.new
  end

  def create

    @state = State.new(state_params)

    if @state.save
      flash[:notice] = 'State was saved successfully.'
      redirect_to @state
    else
      flash.now[:alert] = "There was an error saving the state. Please try again."
      render :new
    end
  end

  def edit
    @state = State.find(params[:id])
  end

   def update
    @state = State.find(params[:id])
    @state.assign_attributes(state_params)
 
     if @state.save
       flash[:notice] = "State was updated successfully."
       redirect_to @state
     else
       flash.now[:alert] = "There was an error saving this state. Please try again."
       render :edit
     end
   end

  def destroy
    @state = State.find(params[:id])
 
     if @state.destroy
       flash[:notice] = "\"#{@state.name}\" was deleted successfully."
       redirect_to states_path
     else
       flash.now[:alert] = "There was an error deleting the State."
       render :show
     end
   end

   private

   def state_params
    params.require(:state).permit(:name, :population, :x, :y, :note)
   end

end
