require 'van'

describe "Van" do
	let(:bike) { double :bike }
	let(:van) { Van.new(capacity: 10) }

it 'should pickup a bike' do
	expect(van.bike_count).to eq(0)
	van.pickup(bike)
	expect(van.bike_count).to eq(1)
end

it 'should dropoff a bike' do
	van.pickup(bike)
	expect(van.bike_count).to eq(1)
	van.dropoff(bike)
	expect(van.bike_count).to eq(0)
end

it "should know when it's full" do
	expect(van).not_to be_full
	10.times { van.pickup(bike) }
	expect(van).to be_full
end

it "should not pickup a bike if it's full" do
	10.times { van.pickup(bike) }
	expect(lambda { van.pickup(bike) }).to raise_error(RuntimeError)
end

end