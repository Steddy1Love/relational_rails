require "rails_helper"

RSpec.describe "Vehicle Index Page", type: :feature do
  # User Story 3, Child Index 

  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)

  describe "As a User when I visit '/vehicles'" do
    it "I then see each vehicle in the system including attributes" do
      gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
      rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)
      ct4 = gm.vehicles.create!(name: 'CT4', favorite_type: true, number_of_cylinders: 6)
      r2 = rivian.vehicles.create!(name: 'R2', favorite_type: false, number_of_cylinders: 0)

      visit "/vehicles"
      save_and_open_page
      expect(page).to have_content("Name: #{r2.name}")
      expect(page).to have_content("Name: #{ct4.name}")
      expect(page).to have_content("Favorite: #{ct4.favorite_type}")
      expect(page).to have_content("Pistons: #{ct4.number_of_cylinders}")
      expect(page).to have_content("Favorite: #{r2.favorite_type}")
      expect(page).to have_content("Pistons: #{r2.number_of_cylinders}")
    end
    
  end
end