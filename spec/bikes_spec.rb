require 'bikes'

describe "Bike" do

let(:bike) { Bikes.new }

it 'is not broken' do
expect(bike).not_to be_broken
end

it 'can break itself and become broken' do
	bike.break!
	expect(bike).to be_broken
end

it 'can fix itself when broken and become not broken' do
	bike.break!.fix!
	expect(bike).not_to be_broken
end

end