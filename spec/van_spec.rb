require 'van'
require 'dockingstation'

describe "Van" do
	let(:van) { Van.new(capacity: 10) }

	# it 'accepts broken bikes from the docking station' do
	# 	# station = DockingStation.new
	# 	station = double :station
	# 	expect(station).to receive(:release_broken_bikes_to)
	# 	van.accept_broken_bikes_from(station)
	# end

	it 'has two broken bikes in the van when accepting two broken bikes from the station' do
		station = DockingStation.new
		broken_bike_1 = double :bike, broken?: true
		broken_bike_2 = double :bike, broken?: true
		# station = double :station, bikes: [broken_bike_1, broken_bike_2], release_broken_bikes_to: broken_bikes.each {}
		expect(van.bikes.count).to eq(0)
		station.accept(broken_bike_1)
		station.accept(broken_bike_2)
		expect(station.bikes.count).to eq(2)
		station.release_broken_bikes_to(van)
		van.accept_broken_bikes_from(station)
		expect(van.bikes.count).to eq(2)
	end

end
