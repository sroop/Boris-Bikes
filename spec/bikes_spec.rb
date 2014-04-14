require 'bikes'

describe "Bikes" do

it 'should not be broken' do
bike = Bikes.new
expect(bike).not_to be_broken
end

end