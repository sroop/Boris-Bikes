require_relative 'bike_container'

class Van

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def accept_broken_bikes_from(station)
		station.release_broken_bikes_to(self)
	end

	def release_broken_bikes_to(garage)
		broken_bikes.each do |bike| 
			release(bike)
			garage.bikes << bike
		end
	end

# alias :pickup :accept
# alias :dropoff :release

end
