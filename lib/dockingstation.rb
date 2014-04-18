require_relative 'bike_container'

class DockingStation

	include BikeContainer

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def release_broken_bikes_to(van)
		if van.class == Van
			broken_bikes.each do |bike| 
				release(bike)
				van.bikes << bike
			end
		else
			raise "Nice try you fucking idiot!!"
		end
		#takes a list of broken bikes
		#deletes them out of the station's container
		#and releases them to the van
		#the van accepts these into his own container
	end

	def release_one_working_bike_to(person)
		raise "Sorry! No bikes available!" if bikes == []
		working_bikes.pop(1)
		# takes a list of working bikes
		#deletes ONE out of this list
		#and releases it to a person
	end

	def accept_working_bikes_from(van)
		van.release_working_bikes_to(self)
	end

	def release_working_bikes_to(object)
		if object.class == Person
			release_one_working_bike_to(object)
		else
			raise "The station only rents working bikes to people. Pick up some fucking broken bikes dick head...that's your fucking job isn't it??"
		end
	end

alias :dock :accept
# alias :rent :release

end