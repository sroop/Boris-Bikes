require 'dockingstation'
require 'van'

describe "Docking Station" do

	let(:broken_bike_1) { double :bike, broken?: true }
	let(:broken_bike_2) { double :bike, broken?: true }
 	let(:bike) { double :bike, broken?: false }
 	let(:station) { DockingStation.new(capacity: 20) }
 	let(:van) { double :van, bikes: [broken_bike_1, broken_bike_2] }
 	let(:person) { double :person, bikes: [] }

it 'releases broken bikes to the van' do
	real_van = Van.new
	station.accept(broken_bike_1)
	station.accept(broken_bike_2)
	expect(station.bikes).to eq([broken_bike_1, broken_bike_2])
	expect(station.release_broken_bikes_to(real_van)).to eq([broken_bike_1, broken_bike_2])
end

it 'has no broken bikes in the station after releasing broken bikes to the van' do
	real_van = Van.new
	station.accept(broken_bike_1)
	station.accept(broken_bike_2)
	station.accept(bike)
	expect(station.bikes).to eq([broken_bike_1, broken_bike_2, bike])
	station.release_broken_bikes_to(real_van)
	expect(station.bikes).to eq([bike])
end

it 'releases one working bike to a person' do
	station.accept(bike)
	expect(station).to have_bikes
	expect(station.release_one_working_bike_to(person)).to eq([bike])
end

it 'raises an error when the station releases broken bikes to a person' do
	station.accept(broken_bike_1)
	expect { station.release_broken_bikes_to(person) }.to raise_error(RuntimeError)
end

it 'accepts working bikes from the van' do
	real_van = Van.new
	real_van.accept(bike)
	station.accept_working_bikes_from(real_van)
end

it 'raises an error if anyone other than a person tries to take a working bike from the station' do
	station.accept(bike)
	expect { station.release_working_bikes_to(van) }.to raise_error(RuntimeError)
end


# I think i can now remove the accept and release method out of the bike container
# because it is no longer being used
# this is because each object has their own accept and receive condition
# as they interact only with very specific objects.
# i don't need a generic 'accept all' method as i dont want each object to have this
# but check what other class methods utilize the accept/release methods
# I might need to re-write these methods inside their own class??
# OR maybe find out if it's possible to lock down the methods in the module
# so they cannot be used in the execution of the game in irb
# but still use them inside of other methods that are being called in the game in irb

# the last step when every single interaction is accounted for
# is to create object specific aliases for accepting/receiving bikes
# and then remove the repetitive methods based on the best wording.
# example- van picks up and drops off bikes. so i can remove garage releasing bikes
# as a garage releasing working bikes is the same as a van picking up broken bikes.
# but i would prefer the wording 'van picks up'.

end