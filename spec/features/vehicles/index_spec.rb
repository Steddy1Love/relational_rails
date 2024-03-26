require "rails_helper"

RSpec.describe "Vehicle Index Page", type: :feature do
  before :each do
    @gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
    @rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)
    @ferrari = Manufacturer.create!(name: 'Ferrari', number_of_sub_manufacturers: 1 , favorite_manufacturer: false)
    @ct4 = @gm.vehicles.create!(name: 'CT4', favorite_type: true, number_of_cylinders: 6)
    @zl1 = @gm.vehicles.create!(name: 'ZL1', favorite_type: false, number_of_cylinders: 8)
    @r2 = @rivian.vehicles.create!(name: 'R2', favorite_type: false, number_of_cylinders: 0)
    @gto = @ferrari.vehicles.create!(name: '599 GTO', favorite_type: false, number_of_cylinders: 12)
  end
  
  describe "As a User when I visit '/vehicles'" do
    it "I then see each vehicle in the system including attributes" do
      visit "/vehicles"

      expect(page).to have_content("Name: #{@r2.name}")
      expect(page).to have_content("Name: #{@ct4.name}")
      expect(page).to have_content("Favorite: #{@ct4.favorite_type}")
      expect(page).to have_content("Pistons: #{@ct4.number_of_cylinders}")
      expect(page).to have_content("Favorite: #{@r2.favorite_type}")
      expect(page).to have_content("Pistons: #{@r2.number_of_cylinders}")
    end
  end

  describe "As a User when I visit '/vehicles/:id'" do

    it "Sees the vehicle with the associated ID" do
      visit "/vehicles/#{@ct4.id}"

      expect(page).to_not have_content("#{@r2.name}")
      expect(page).to_not have_content("#{@gto.name}")
      expect(page).to have_content("#{@ct4.name}")
      expect(page).to have_content("Favorite type: #{@ct4.favorite_type}")
      expect(page).to have_content("Pistons?: #{@ct4.number_of_cylinders}")
      expect(page).to_not have_content("Favorite type: #{@r2.favorite_type}")
      expect(page).to_not have_content("Pistons?: #{@r2.number_of_cylinders}")
    end

    it "Then I see the vehicles link at the top of the page" do
      visit "/vehicles/#{@r2.id}"
      click_on("All Vehicles")
      expect(page).to have_content("All Vehicles")
    end

    # User Story 9, Parent Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index

    it "Then I see the manufacturers link at the top of the page" do
      visit "/vehicles/#{@gto.id}"
      click_on("All Manufacturers")
      expect(page).to have_content("All Manufacturers")
    end
  end 
end