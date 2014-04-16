require 'dockingstation'

describe "Docking Station" do

	let(:broken_bike_1) { double :bike, broken?: true }
	let(:broken_bike_2) { double :bike, broken?: true }
 	let(:bike) { double :bike, broken?: false }
 	let(:station) { DockingStation.new(capacity: 20) }
 	let(:van) { double :van }
 	let(:person) { double :person }

it 'releases broken bikes to the van' do
	station.accept(broken_bike_1)
	station.accept(broken_bike_2)
	expect(station.release_broken_bikes_to(van)).to eq([broken_bike_1, broken_bike_2])
end

it 'has no broken bikes in the station after releasing broken bikes to the van' do
	station.accept(broken_bike_1)
	station.accept(broken_bike_2)
	station.accept(bike)
	expect(station.bikes).to eq([broken_bike_1, broken_bike_2, bike])
	station.release_broken_bikes_to(van)
	expect(station.bikes).to eq([bike])
end

it 'releases one working bike to a person' do
	station.accept(bike)
	expect(station).to have_bikes
	expect(station.release_one_working_bike_to(person)).to eq([bike])
end

end