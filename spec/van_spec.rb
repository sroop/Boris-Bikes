require 'van'

describe "Van" do

it 'should accept a bike' do
	bike = double :bike
	van = Van.new
	expect(van.bike_count).to eq(0)
	van.pickup(bike)
	expect(van.bike_count).to eq(1)
end

end