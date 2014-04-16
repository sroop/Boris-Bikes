require 'garage'

describe "The Garage" do

	let(:bike) {double :bike}
	let(:broken_bike) {double :bike, broken?: false}
	let(:garage) { Garage.new }

	it 'repairs broken bikes' do
	garage.accept(broken_bike)
	expect(broken_bike).to receive(:fix!)
	garage.repair(broken_bike)
	expect(broken_bike).not_to be_broken
end

end