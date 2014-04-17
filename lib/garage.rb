require_relative 'bike_container'

class Garage

	include BikeContainer

	DEFAULT_CAPACITY = 30

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end


	def repair(bike)
		bike.fix!
	end

	def accept_broken_bikes_from(van)
		van.release_broken_bikes_to(self)
	end

end