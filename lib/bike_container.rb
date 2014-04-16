module BikeContainer

	DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
	end

	def working_bikes
		bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		bikes.select { |bike| bike.broken? }
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def accept(bike)
		raise "Full up! No more space!" if full?
		bikes << bike
	end

	# def accept(bike, object)
	# 	raise "Full up! No more space!" if full?
	# 	if self.class == Van
	# 		bikes << bike
	# 		object.release(bike)
	# 	else
	# 		raise "You not allowed because you are a #{object.class}"
	# 	end
	# end

	
	def release(bike)
		raise "Sorry! No bikes available!" if bikes == []
		bikes.delete(bike)
	end

	def full?
		bikes.count == capacity
	end

end