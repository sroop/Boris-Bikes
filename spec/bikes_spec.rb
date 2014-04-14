require 'bikes'

describe "Bikes" do

it 'should not be broken' do
bike = Bikes.new
expect(bike).not_to be_broken
end

it 'should be able to break' do
	bike = Bikes.new
	bike.break
	expect(bike).to be_broken
end

it 'should be fixed when the bike is broken' do
	bike = Bikes.new
	bike.break
	bike.fix
	expect(bike).not_to be_broken
end

end