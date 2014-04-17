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

it 'does not release broken bikes to a person' do
	station.accept(broken_bike_1)
	expect { station.release_broken_bikes_to(person) }.to raise_error(RuntimeError)
end


end