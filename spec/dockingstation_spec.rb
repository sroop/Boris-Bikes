require 'dockingstation'

describe "Docking Station" do

	let(:broken_bike_1) { double :bike, broken?: true }
	let(:broken_bike_2) { double :bike, broken?: true }
 	let(:bike) { double :bike, broken?: false }
 	let(:station) { DockingStation.new(capacity: 20) }
 	let(:van) { double :van }

it 'releases broken bikes to the van' do
	station.accept(broken_bike_1)
	station.accept(broken_bike_2)
	expect(station.release_broken_bikes_to(van)).to eq([broken_bike_1, broken_bike_2])
end

end