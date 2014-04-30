class WildfiresController < ApplicationController

	def index
		@wildfires = Wildfire.all
		@wildfires = Wildfire.search(params[:search])
    if @wildfires.count == 0
      @wildfires = Wildfire.joins(:location).where('location_name = ?', "#{params[:search]}")
    end
	end

	def new
		@new_wildfire = Wildfire.new
	end

	def show
		@wildfire = Wildfire.find(params[:id])
	end

	def create
		@new_wildfire = Wildfire.new(wildfire_params)
		if @new_wildfire.save
			redirect_to wildfires_path
		else
			redirect_to new_wildfire_path
		end
	end

	def search
		@search = Wildfire.search(params[:search])
		render :index
	end

	def edit
		@wildfire = Wildfire.find(params[:id])
	end

	def update
		@wildfire = Wildfire.find(params[:id])
		if @wildfire.update_attributes(wildfire_params)
			redirect_to wildfires_path
		else
      redirect_to edit_wildfire_path
		end
	end

	def destroy
		@wildfire = Wildfire.find(params[:id])
		@wildfire.destroy
			redirect_to wildfires_path
	end


	private

	def wildfire_params
		params.require(:wildfire).permit(:wildfire_name, :wildfire_date, :wildfire_cost, :wildfire_cause, :location_id)
  	end
end
