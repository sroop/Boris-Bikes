require 'dockingstation'

describe "Docking Station" do
 	let(:bike) {double :bike}
 	let(:station) { DockingStation.new(capacity: 20)}

it 'should accept all bikes' do
	expect(station.bike_count).to eq(0)
	station.accept(bike)
	expect(station.bike_count).to eq(1)
end

it 'should release a broken bike' do
	broken_bike = double :bike, broken?: true
	station.accept(broken_bike)
	expect(station.bike_count).to eq(1)
	station.release_broken_bikes
	expect(station.bike_count).to eq(0)
end

it 'should release a working bike' do
	working_bike = double :bike, broken?: false
	station.accept(working_bike)
	expect(station.bike_count).to eq(1)
	station.release_working_bikes
	expect(station.bike_count).to eq(0)
end

it "should know when it's reached full capacity" do
	expect(station).not_to be_full
	20.times { station.accept(bike) }
	expect(station).to be_full
end

it "should not accept a bike if it's reached full capacity" do
	20.times { station.accept(bike) }
	expect(lambda { station.accept(bike) }).to raise_error(RuntimeError)
end

it 'should provide a list of working bikes' do
	working_bike = double :bike, broken?: false
	broken_bike = double :bike, broken?: true
	station.accept(working_bike)
	station.accept(broken_bike)
	expect(station.working_bikes).to eq([working_bike])
end

it 'should provide a list of broken bikes' do
	working_bike = double :bike, broken?: false
	broken_bike = double :bike, broken?: true
	station.accept(working_bike)
	station.accept(broken_bike)
	expect(station.broken_bikes).to eq([broken_bike])
end

end