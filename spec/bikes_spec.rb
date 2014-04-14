require 'bikes'

describe "Bikes" do

let(:bike) { Bikes.new }

it 'should not be broken' do
expect(bike).not_to be_broken
end

it 'should be able to break' do
	bike.break!
	expect(bike).to be_broken
end

it 'should be fixed when the bike is broken' do
	bike.break!.fix!
	expect(bike).not_to be_broken
end

end