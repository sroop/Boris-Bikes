require_relative 'bike_container'

class Garage

	include BikeContainer

	DEFAULT_CAPACITY = 30

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	# def bike_count
	# 	@bikes.count
	# end

	# def accept(broken_bike)
	# 	raise "Garage is full" if full?
	# 	@bikes << broken_bike
	# end

	def repair(bike)
		bike.fix!
	end

	# def release_working_bike
	# 	working_bikes.map { |bike| @bikes.delete(bike) }
	# end

	# def working_bikes
	# 	@bikes.reject { |bike| bike.broken? }
	# end

	# def full?
	# 	bike_count == @capacity
	# end
end