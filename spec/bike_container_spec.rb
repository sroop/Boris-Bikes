require 'bike_container'

class DummyContainer
	include BikeContainer
end

describe "Bike Container" do

	let(:bike) {double :bike}
	let(:container) {DummyContainer.new}

	it 'accepts bikes' do
	expect(container.bikes.count).to eq(0)
	container.accept(bike)
	expect(container.bikes.count).to eq(1)
	end

	it 'releases bikes' do
	expect(container.bikes.count).to eq(0)
	container.accept(bike)
	expect(container.bikes.count).to eq(1)
	container.release(bike)
	expect(container.bikes.count).to eq(0)
	end

end