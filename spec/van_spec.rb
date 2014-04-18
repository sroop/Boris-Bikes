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

	it 'raises an error when the van tries to release broken bikes to the station' do
		broken_bike_1 = double :bike, broken?: true
		broken_bike_2 = double :bike, broken?: true
		station = DockingStation.new
		station.accept(broken_bike_1)
		station.accept(broken_bike_2)
		van.accept_broken_bikes_from(station)
		expect(van.bikes.count).to eq(2)
		expect { van.release_broken_bikes_to(station) }.to raise_error(RuntimeError)	
	end

	it 'accepts working bikes from the garage' do
		real_bike = Bikes.new
		real_garage = Garage.new
		real_bike.break!
		real_garage.accept(real_bike)
		real_bike.fix!
		real_garage.repair
		expect(real_garage).to receive(:release_working_bikes_to)
		van.accept_working_bikes_from(real_garage)
	end

	it 'releases working bikes to the docking station' do
		real_garage = Garage.new
		working_bike = double :bike, broken?: false
		broken_bike = double :bike, broken?: true
		station = DockingStation.new
		van.accept(broken_bike)
		van.accept(working_bike)
		expect(van.bikes.count).to eq(2)
		van.release_working_bikes_to(station)
		expect(van.bikes.count).to eq(1)
		expect(station.bikes.count).to eq(1)
	end

	it 'raises an error when the van tries to release working bikes to the garage' do
		real_garage = Garage.new
		working_bike = double :bike, broken?: false
		broken_bike = double :bike, broken?: true
		van.accept(broken_bike)
		van.accept(working_bike)
		expect { van.release_working_bikes_to(real_garage) }.to raise_error(RuntimeError)
	end
end
