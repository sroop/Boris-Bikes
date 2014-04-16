require 'dockingstation'

describe "Docking Station" do

	let(:bike) {double :bike}
	let(:broken_bike) {double :bike, broken?: true}
	let(:working_bike) {double :bike, broken?: false}
	let(:container) {DummyContainer.new}

	it 'accepts bikes' do
		expect(container.bikes.count).to eq(0)
		container.accept(bike)
		expect(container.bikes.count).to eq(1)
	end

	it 'releases bikes' do
		expect(container.bikes.count).to eq(0)
		container.accept(bike)
		expect(container.bikes.count).to eq(1)
		container.release(bike)
		expect(container.bikes.count).to eq(0)
	end

	it 'can reach full capacity' do
		expect(container).not_to be_full
		20.times { container.accept(bike) }
		expect(container).to be_full
	end

	it 'raises an error when it reaches full capacity' do
		expect(container.bikes.count).to eq(0)
		20.times { container.accept(bike) }
		expect(lambda { container.accept(bike) }).to raise_error(RuntimeError)
	end

	it 'segregates broken bikes' do
		container.accept(broken_bike)
		container.accept(working_bike)
		expect(container.broken_bikes).to eq([broken_bike])
	end

	it 'segregates working bikes' do
		container.accept(broken_bike)
		container.accept(working_bike)
		expect(container.working_bikes).to eq([working_bike])
	end

#  	let(:bike) {double :bike}
#  	let(:station) { DockingStation.new(capacity: 20)}

# it 'should accept all bikes' do
# 	expect(station.bike.count).to eq(0)
# 	station.accept(bike)
# 	expect(station.bike.count).to eq(1)
# end

# it 'should release a broken bike' do
# 	broken_bike = double :bike, broken?: true
# 	station.accept(broken_bike)
# 	expect(station.bike.count).to eq(1)
# 	station.release_broken_bikes
# 	expect(station.bike.count).to eq(0)
# end

# it 'should release a working bike' do
# 	working_bike = double :bike, broken?: false
# 	station.accept(working_bike)
# 	expect(station.bike.count).to eq(1)
# 	station.release_working_bikes
# 	expect(station.bike.count).to eq(0)
# end

# it "should know when it's reached full capacity" do
# 	expect(station).not_to be_full
# 	20.times { station.accept(bike) }
# 	expect(station).to be_full
# end

# it "should not accept a bike if it's reached full capacity" do
# 	20.times { station.accept(bike) }
# 	expect(lambda { station.accept(bike) }).to raise_error(RuntimeError)
# end

# it 'should provide a list of working bikes' do
# 	working_bike = double :bike, broken?: false
# 	broken_bike = double :bike, broken?: true
# 	station.accept(working_bike)
# 	station.accept(broken_bike)
# 	expect(station.working_bikes).to eq([working_bike])
# end

# it 'should provide a list of broken bikes' do
# 	working_bike = double :bike, broken?: false
# 	broken_bike = double :bike, broken?: true
# 	station.accept(working_bike)
# 	station.accept(broken_bike)
# 	expect(station.broken_bikes).to eq([broken_bike])
# end

end