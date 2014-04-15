module BikeContainer

	def bikes
		@bikes ||= []
	end

	def accept(bike)
		bikes << bike
	end

	def release(bike)
		bikes.select { |bike| bikes.delete(bike)}
	end

end