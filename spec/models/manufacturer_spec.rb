require "rails_helper"

RSpec.describe Manufacturer do
  it {should have_many :vehicles}
  before :each do
    @gm = Manufacturer.create!(name: 'Prince')
    @ct4 = @gm.vehicles.create!(name: 'CT4', favorite_type: true, number_of_cylinders: 6)
    @zl1 = @gm.vehicles.create!(name: 'ZL1', favorite_type: false, number_of_cylinders: 8)
  end

  describe "instance methods" do
    it "returns the average number of pistons" do
      expect(@gm.average_pistons.round(2)).to eq(7)
    end
  end
end