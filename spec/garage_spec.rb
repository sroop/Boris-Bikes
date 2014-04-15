require 'garage'
require 'bikes'

describe "The Garage" do
	let(:broken_bike) { double :bike, broken?: false, fix!: :blah }
	let(:garage) { Garage.new }

it 'should accept a broken bike' do
	expect(garage.bike_count).to eq(0)
	garage.accept(broken_bike)
	expect(garage.bike_count).to eq(1)
end

it 'should repair a broken bike' do
	# garage.accept(broken_bike)
	# garage.repair(broken_bike)
	# expect(broken_bike).not_to be_broken
	bike = Bikes.new
	expect(bike).not_to be_broken
	bike.break!
	expect(bike).to be_broken
	garage.accept(bike)
	garage.repair(bike)
	expect(bike).not_to be_broken


	bike = double :bike

end

# it 'should release working bikes' do
# 	garage.accept(broken_bike)
# 	expect(garage.bike_count).to eq(1)
# 	expect(working_bike).to eq(broken_bike.fix!)
# 	garage.release_working_bike
# 	expect(garage.count).to eq(0)
# end

end