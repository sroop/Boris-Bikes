class Van
	DEFAULT_CAPACITY = 10

def initialize(options = {})
	@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	@bikes = []
end

def bike_count
	@bikes.count
end 

def pickup(bike)
	raise "Van is full" if full?
	@bikes << bike
end

def dropoff(bike)
	@bikes.delete(bike)
end

def full?
	bike_count == @capacity
end

end
