require 'van'

describe "Van" do
	let(:bike) { double :bike }
	let(:van) { Van.new }

it 'should accept a bike' do
	expect(van.bike_count).to eq(0)
	van.pickup(bike)
	expect(van.bike_count).to eq(1)
end

it 'should release a bike' do
	van.pickup(bike)
	expect(van.bike_count).to eq(1)
	van.dropoff(bike)
	expect(van.bike_count).to eq(0)
end

end