class LocationsController < ApplicationController

	def index
		@locations = Location.all
	end

	def new
		@new_location = Location.new
	end

	def show
		@location = Location.find(params[:id])
	end

	def create
		@new_location = Location.new(location_params)
		if @new_location.save
			redirect_to locations_path
		else
			redirect_to new_location_path
		end
	end

	def edit
		@location = Location.find(params[:id])
	end

	def update
		@location = Location.find(params[:id])
		if @location.update_attributes(location_params)
			redirect_to locations_path
		end
	end

	# PATCH "locations/:id/change_available_forest_firefighters"
	def change_availability
		@location=Location.find(params[:id])
		if @location.available_forest_firefighters
			val = false
		else 
			val = true
		end
		@location.update_attributes(:available_forest_firefighters => val)
		redirect_to locations_path
	end

	def destroy
	    @location = Location.find(params[:id])
	    @location.delete
			redirect_to locations_path
  	end

	private

	def location_params
		params.require(:location).permit(:location_name, :location_size, :available_forest_firefighters)
	end

end