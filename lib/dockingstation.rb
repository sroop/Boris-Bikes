require_relative 'bike_container'

class DockingStation

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def release_broken_bikes_to(van)
		broken_bikes.map { |bike| release(bike) }
		#takes a list of broken bikes
		#deletes them out of the station 
		#and releases them to the van
		# somehow the van needs to accept these?
	end

	def release_one_working_bike_to(person)
		working_bikes.pop(1)
		# takes a list of working bikes
		#deletes ONE out of this list
		#and releases it to a person
	end

	# def dock(bike)
	# 	bikes << bike
	# end

# alias :dock :accept
# alias :rent :release


end