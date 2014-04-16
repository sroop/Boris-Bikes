require 'van'

describe "Van" do
	let(:bike) { double :bike }
	let(:van) { Van.new(capacity: 10) }

it 'accepts bikes' do
	expect(van.bikes.count).to eq(0)
	van.accept(bike)
	expect(van.bikes.count).to eq(1)
end

it 'releases bikes' do
	van.accept(bike)
	expect(van.bikes.count).to eq(1)
	van.release(bike)
	expect(van.bikes.count).to eq(0)
end

# it "should know when it's full" do
# 	expect(van).not_to be_full
# 	10.times { van.accept(bike) }
# 	expect(van).to be_full
# end

# it "should not pickup a bike if it's full" do
# 	10.times { van.accept(bike) }
# 	expect(lambda { van.accept(bike) }).to raise_error(RuntimeError)
# end

end
