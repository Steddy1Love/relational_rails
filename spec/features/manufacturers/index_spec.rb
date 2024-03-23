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

      #User Story 6, Parent Index sorted by Most Recently Created 

      # As a visitor
      # When I visit the parent index,
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created

    it "Then I see that records are orderd by most recently created first and see when it was created" do
      visit "/manufacturers"
      save_and_open_page
      expect(this).to appear_before(that)
    end  
    # User Story 7, Parent Child Count
    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
  end
end