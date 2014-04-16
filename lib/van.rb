require_relative 'bike_container'

class Van

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	# def collect_broken_bikes_from(station)
	# 	station.broken_bikes.each do |bike| 
	# 		self.bikes << bike 
	# 		station.bikes.delete(bike)
	# 	end
	# end

# alias :pickup :accept
# alias :dropoff :release

end
