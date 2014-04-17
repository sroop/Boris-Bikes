require 'garage'
require 'van'

describe "The Garage" do

	let(:bike) {double :bike}
	let(:broken_bike_1) {double :bike, broken?: false}
	let(:broken_bike_2) {double :bike, broken?: false}
	let(:garage) { Garage.new }
	let(:van) {double :van}


	it 'repairs broken bikes' do
		garage.accept(broken_bike_1)
		expect(broken_bike_1).to receive(:fix!)
		garage.repair(broken_bike_1)
		expect(broken_bike_1).not_to be_broken
	end

	it 'accepts broken bikes from the van' do
		expect(van).to receive(:release_broken_bikes_to)
		garage.accept_broken_bikes_from(van)
	end

	#next test is to get the garage to release working bikes to the van.
	# and then for the van to release working bikes to the docking station
	#then I need to create a person class..

	# problems: accepting and releasing broken bikes van- dockingstation, van- garage are repetitive. accepting broken bikes is the same as the object its interacting with releasing to it. hmm...

end