class Wildfire < ActiveRecord::Base
	belongs_to :location

	def self.search(query)
		where("wildfire_name LIKE ?", "%#{query}%")
	end
end