class Van

def initialize
	@bikes = []
end

def bike_count
	@bikes.count
end 

def pickup(bike)
	@bikes << bike
end

def dropoff(bike)
	@bikes.delete(bike)
end

end