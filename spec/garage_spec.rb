require 'garage'
require 'van'
require 'bikes'

describe "The Garage" do

	let(:bike) {double :bike, broken?: false}
	let(:broken_bike_1) {double :bike, broken?: false}
	let(:broken_bike_2) {double :bike, broken?: false}
	let(:garage) { Garage.new }
	let(:van) {double :van}
	let(:person) { double :person}


	it 'repairs broken bikes' do
		real_bike = Bikes.new
		real_bike.break!
		garage.accept(real_bike)
		real_bike.fix!
		garage.repair
		expect(real_bike).not_to be_broken
	end

	it 'accepts broken bikes from the van' do
		expect(van).to receive(:release_broken_bikes_to)
		garage.accept_broken_bikes_from(van)
	end

	it 'releases working bikes to the van' do
		real_van = Van.new
		real_bike = Bikes.new
		garage.accept(real_bike)
		expect(garage).to have_bikes
		real_bike.fix!
		garage.repair
		garage.release_working_bikes_to(real_van)
		expect(garage).to_not have_bikes
		expect(real_van).to have_bikes
	end

	it 'only releases working bikes to the van, no one else!' do
		real_bike = Bikes.new
		garage.accept(real_bike)
		expect(garage).to have_bikes
		real_bike.fix!
		garage.repair
		expect { garage.release_working_bikes_to(person) }.to raise_error(RuntimeError)
	end

	# it 'says it has no bikes when there are no working bikes to release to the van' do
		
	# end

end