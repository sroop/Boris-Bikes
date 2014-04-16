require 'van'
# require 'bikes'
# require 'dockingstation'

describe "Van" do
	let(:bike) { double :bike }
	let(:broken_bike) { double :bike, broken?: true }
	let(:van) { Van.new(capacity: 10) }
	let(:station) { double :station }
	let(:garage) { double :garage }

# it 'drops off broken bikes at the garage' do
# 	van.accept(broken_bike)
# 	expect(van.broken_bikes.count).to eq(1)
# 	# van.broken_bikes.each { |bike| garage.bikes << bike }
# 	garage.bikes << van.release(broken_bike)
# 	expect(van.broken_bikes.count).to eq(0)
# 	expect(garage.broken_bikes.count).to eq(1)
# end

	# it "can collect broken bikes from a station" do
	# 	bike = Bikes.new
	# 	station = DockingStation.new
	# 	van = Van.new
	# 	bike.break!
	# 	station.dock(bike)
	# 	expect(station.broken_bikes).to eq [bike]
	# 	van.collect_broken_bikes_from(station)
	# 	expect(van.bikes).to eq [bike]
	# 	expect(station.bikes.count).to eq 0
	# end

	# it "collects broken bikes from the docking station" do
	# 	station.dock(bike)
	# 	expect(station.broken_bikes).to eq(1)
	# 	van.collect_broken_bikes_from(station)
	# 	expect(van.bikes).to eq(1)
	# 	expect(station.bikes.count).to eq(0)
	# end
		
end
