module BikeContainer

	def bikes
		@bikes ||= []
	end

	def accept(bike)
		bikes << bike
	end

end