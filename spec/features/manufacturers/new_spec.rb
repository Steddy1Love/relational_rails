require "rails_helper"

RSpec.describe "Manufacturer New Form", type: :feature do
  before :each do
    @gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
    @ferrari = Manufacturer.create!(name: 'Ferrari', number_of_sub_manufacturers: 1 , favorite_manufacturer: false)
    @rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)
    @ct4 = @gm.vehicles.create!(name: 'CT4', favorite_type: true, number_of_cylinders: 6)
    @zl1 = @gm.vehicles.create!(name: 'ZL1', favorite_type: false, number_of_cylinders: 8)
    @r2 = @rivian.vehicles.create!(name: 'R2', favorite_type: false, number_of_cylinders: 0)
    @gto = @ferrari.vehicles.create!(name: '599 GTO', favorite_type: false, number_of_cylinders: 12)
  end
  
  describe "From Manufacturer Index" do
    it "Then I see a link to create a new Manufacturer" do
      visit "/manufacturers"
      # find("#new-manufacturer").click
      click_link("New Manufacturer")

      expect(current_path).to eq("/manufacturers/new")
      expect(page).to have_content("Create a manufacturer")

      fill_in "Name", with: "Ford"
      fill_in "Number of sub manufacturers", with: 2
      choose "Yes"
      save_and_open_page

      click_on("Submit")

      expect(current_path).to eq("/manufacturers")
      expect(page).to have_content("Ford")
    end
  end
end





# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.