#Wildfire App#

* Display data from two models
	> :location has_many :wildfires
	> :wildfire belongs_to :location
* Index, new, and show for both resources
* Associate new wildfires with existing locations
* Searches that let you query on both tables including JOINS
* Queries performed in controller using params sent.
* Custom collection route for the search.
* Use form_tag for searches
* Render the results in the same search action instead of redirecting