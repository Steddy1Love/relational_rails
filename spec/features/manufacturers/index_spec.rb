require 'rails_helper'

RSpec.describe "Manufacturer Index Page", type: :feature do
  before :each do
    @gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
    @ferrari = Manufacturer.create!(name: 'Ferrari', number_of_sub_manufacturers: 1 , favorite_manufacturer: false)
    @rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)
  end

  describe "As a User when I visit '/manufacturers'"do
    let(:this) {"#{@gm.name}"}
    let(:that) {"#{@ferrari.name}"}
    
    it "Then I see the name of each manufacturer record in the system" do
      visit "/manufacturers"

      expect(page).to have_content("Name: #{@gm.name}")
      expect(page).to have_content("Name: #{@ferrari.name}")
      expect(page).to have_content("Name: #{@rivian.name}")

      expect(page).to have_content("Number of sub manufacturers: #{@gm.number_of_sub_manufacturers}")
      expect(page).to have_content("Number of sub manufacturers: #{@ferrari.number_of_sub_manufacturers}")
      expect(page).to have_content("Number of sub manufacturers: #{@rivian.number_of_sub_manufacturers}")

      expect(page).to have_content("Favorite manufacturer: #{@gm.favorite_manufacturer}")
      expect(page).to have_content("Favorite manufacturer: #{@ferrari.favorite_manufacturer}")
      expect(page).to have_content("Favorite manufacturer: #{@rivian.favorite_manufacturer}")
    end

    it "Then I see the attributes of each manufacturer in the system" do
      visit "/manufacturers/#{@gm.id}"

      expect(page).to have_content("#{@gm.name}")
      expect(page).to_not have_content("Name: #{@rivian.name}")
      expect(page).to have_content("Number of sub manufacturers: #{@gm.number_of_sub_manufacturers}")
      expect(page).to have_content("Favorite manufacturer: #{@gm.favorite_manufacturer}")
      expect(page).to have_content("Created at: #{@gm.created_at}")
      expect(page).to have_content("Updated at: #{@gm.updated_at}")
    end

    it "Then I see that records are orderd by most recently created first and see when it was created" do
      visit "/manufacturers"
      expect(this).to appear_before(that)
    end  
 
    it "Then I see a link at the top of the page that takes me to the vehicles page" do
      visit "/manufacturers"
      click_on("All Vehicles")

      expect(page).to have_content("All Vehicles")
    end
  end
end