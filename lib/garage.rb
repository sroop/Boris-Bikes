require_relative 'bike_container'

class Garage

	include BikeContainer

	DEFAULT_CAPACITY = 30

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	# def repair(bike)
	# 	bike.fix!
	# end
end