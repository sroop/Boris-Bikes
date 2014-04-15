require 'bike_container'

class DummyContainer
	include BikeContainer
end

describe "Bike Container" do

	let(:bike) {double :bike}
	let(:broken_bike) {double :bike, broken?: true}
	let(:working_bike) {double :bike, broken?: false}
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

	it 'can reach full capacity' do
		expect(container).not_to be_full
		20.times { container.accept(bike) }
		expect(container).to be_full
	end

	it 'raises an error when it reaches full capacity' do
		expect(container.bikes.count).to eq(0)
		20.times { container.accept(bike) }
		expect(lambda { container.accept(bike) }).to raise_error(RuntimeError)
	end

	it 'segregates broken bikes' do
		container.accept(broken_bike)
		container.accept(working_bike)
		expect(container.broken_bikes).to eq([broken_bike])
	end

	it 'segregates working bikes' do
		container.accept(broken_bike)
		container.accept(working_bike)
		expect(container.working_bikes).to eq([working_bike])
	end

end