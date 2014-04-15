require 'garage'

describe "The Garage" do
	let(:broken_bike) { double :bike, broken?: false }
	let(:garage) { Garage.new(capacity: 30)}

it 'should accept a broken bike' do
	expect(garage.bike_count).to eq(0)
	garage.accept(broken_bike)
	expect(garage.bike_count).to eq(1)
end

it 'should repair a broken bike' do
	garage.accept(broken_bike)
	expect(broken_bike).to receive(:fix!)
	garage.repair(broken_bike)
	expect(broken_bike).not_to be_broken
end

it 'should release a working bike' do
	garage.accept(broken_bike)
	expect(garage.bike_count).to eq(1)
	garage.release_working_bike
	expect(garage.bike_count).to eq(0)
end

it "should know when it's reached full capacity" do
	expect(garage).not_to be_full
	30.times { garage.accept(broken_bike) }
	expect(garage).to be_full
end

it "should not accept a broken bike if it's reached full capacity" do
	30.times { garage.accept(broken_bike) }
	expect(lambda {garage.accept(broken_bike)}).to raise_error(RuntimeError)
end

end