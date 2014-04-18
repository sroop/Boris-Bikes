require 'van'
require 'dockingstation'
require 'garage'

describe "Van" do
	let(:van) { Van.new(capacity: 10) }

	it 'accepts broken bikes from the docking station' do
		station = double :station
		expect(station).to receive(:release_broken_bikes_to)
		van.accept_broken_bikes_from(station)
	end

	it 'has two broken bikes in the van when accepting two broken bikes from the station' do
		station = DockingStation.new
		broken_bike_1 = double :bike, broken?: true
		broken_bike_2 = double :bike, broken?: true
		expect(van.bikes.count).to eq(0)
		station.accept(broken_bike_1)
		station.accept(broken_bike_2)
		expect(station.bikes.count).to eq(2)
		station.release_broken_bikes_to(van)
		van.accept_broken_bikes_from(station)
		expect(van.bikes.count).to eq(2)
	end

	it 'releases 2 broken bikes to the garage' do
		real_garage = Garage.new
		broken_bike_1 = double :bike, broken?: true
		broken_bike_2 = double :bike, broken?: true
		station = DockingStation.new
		station.accept(broken_bike_1)
		station.accept(broken_bike_2)
		expect(station.bikes.count).to eq(2)
		station.release_broken_bikes_to(van)
		van.accept_broken_bikes_from(station)
		expect(van.bikes.count).to eq(2)
		van.release_broken_bikes_to(real_garage)
		expect(van.bikes.count).to eq(0)
	end

	it 'can only release broken bikes to the garage, no one else!' do
		broken_bike_1 = double :bike, broken?: true
		broken_bike_2 = double :bike, broken?: true
		station = DockingStation.new
		station.accept(broken_bike_1)
		station.accept(broken_bike_2)
		van.accept_broken_bikes_from(station)
		expect(van.bikes.count).to eq(2)
		expect { van.release_broken_bikes_to(station) }.to raise_error(RuntimeError)	
	end

	# it 'accepts working bikes from the garage' do
		
	# end

	# it 'releases working bikes to the docking station' do
		
	# end
end
