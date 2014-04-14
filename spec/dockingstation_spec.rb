require 'dockingstation'

describe "Docking Station" do

it 'should accept a bike' do
	bike = double :bike
	station = DockingStation.new
	expect(station.bike_count).to eq(0)
	station.dock(bike)
	expect(station.bike_count).to eq(1)
end

end