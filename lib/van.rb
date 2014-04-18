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
		if garage.class == Garage
			broken_bikes.each do |bike| 
			release(bike)
			garage.bikes << bike
			end
		else
			raise "Errr...you can't release broken bikes back into the station, doofus! They need to be repaired at the garage."
		end
	end

	def accept_working_bikes_from(garage)
		garage.release_working_bikes_to(self)
	end

	def release_working_bikes_to(station)
		if station.class == DockingStation
			working_bikes.each do |bike|
			release(bike)
			station.bikes << bike
			end
		else
			raise "Those bikes aren't broken! Drop them off at the docking station, idiot. You're a fucking useless van!"
		end
	end

# alias :pickup :accept
# alias :dropoff :release

end
