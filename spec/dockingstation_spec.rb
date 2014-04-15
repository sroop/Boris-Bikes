require 'dockingstation'

describe "Docking Station" do
 	let(:bike) {double :bike}
 	let(:station) { DockingStation.new(capacity: 20)}

it 'should accept a bike' do
	# bike = double :bike
	# station = DockingStation.new(capacity: 20)
	expect(station.bike_count).to eq(0)
	station.dock(bike)
	expect(station.bike_count).to eq(1)
end

it 'should release a bike' do
	# bike = double :bike
	# station = DockingStation.new(capacity: 20)
	station.dock(bike)
	station.release(bike)
	expect(station.bike_count).to eq(0)
end

it "should know when it's full" do
	# bike = double :bike
	# station = DockingStation.new(capacity: 20)
	expect(station).not_to be_full
	20.times { station.dock(bike) }
	expect(station).to be_full
end

it "should not accept a bike if it's full" do
	20.times { station.dock(bike) }
	expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
end

it 'should provide a list of available bikes' do
	working_bike = double :bike, broken?: false
	broken_bike = double :bike, broken?: true
	station.dock(working_bike)
	station.dock(broken_bike)
	expect(station.available_bikes).to eq([working_bike])
end

end