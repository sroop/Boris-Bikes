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

end