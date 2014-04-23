class LocationsController < ApplicationController

	def index
		@locations = Location.all
	end

	def new
		@new_location = Location.new
	end

	def create
		@new_location = Location.new(location_params)
		if @new_location.save
			redirect_to locations_path
		else
			redirect_to new_location_path
		end
	end

	private

	def doctor_params
		params.require(:location).permit!
	end

end
