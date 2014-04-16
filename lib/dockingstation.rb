require_relative 'bike_container'

class DockingStation

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

alias :dock :accept
alias :rent :release

	# def bike_count
	# 	@bikes.count
	# end 

	# def accept(bike)
	# 	raise "Station is full" if full?
	# 	@bikes << bike
	# end

	# def full?
	# 	bike_count == @capacity
	# end

	# def working_bikes
	# 	@bikes.reject { |bike| bike.broken? }
	# end

	# def broken_bikes
	# 	@bikes.select { |bike| bike.broken? }
	# end

	# def release_broken_bikes
	# 	broken_bikes.map { |bike| @bikes.delete(bike) }
	# end

	# def release_working_bikes
	# 	working_bikes.map { |bike| @bikes.delete(bike) }
	# end

end