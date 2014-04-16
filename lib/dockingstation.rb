require_relative 'bike_container'

class DockingStation

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def release_broken_bikes_to(van)
		broken_bikes.map { |bike| release(bike) }
		# somehow the van needs to accept these?
	end

	# def dock(bike)
	# 	bikes << bike
	# end

# alias :dock :accept
# alias :rent :release


end