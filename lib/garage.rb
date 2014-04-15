class Garage

	def initialize
		@bikes = []
	end

	def bike_count
		@bikes.count
	end

	def accept(broken_bike)
		@bikes << broken_bike
	end

	def repair(broken_bike)
		broken_bike.fix!
	end

	def release_working_bike
		working_bikes.map { |bike| @bikes.delete(bike) }
	end

	def working_bikes
		@bikes.reject { |bike| bike.broken? }
	end

end