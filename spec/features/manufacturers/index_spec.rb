require 'rails_helper'

RSpec.describe "Manufacturer Index Page", type: :feature do
  # Arrange
  # Act
  # Assert
  
    describe "As a User when I visit '/manufacturers'"do
      
      it "Then I see the name of each manufacturer record in the system" do
        gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
        ferrari = Manufacturer.create!(name: 'Ferrari', number_of_sub_manufacturers: 1 , favorite_manufacturer: false)
        rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)
  
        visit "/manufacturer

        expect(page).to have_content("Name: #{gm.name}")
        expect(page).to have_content("Name: #{ferrari.name}")
        expect(page).to have_content("Name: #{rivian.name}")
  
        expect(page).to have_content("Number of sub manufacturers: #{gm.number_of_sub_manufacturers}")
        expect(page).to have_content("Number of sub manufacturers: #{ferrari.number_of_sub_manufacturers}")
        expect(page).to have_content("Number of sub manufacturers: #{rivian.number_of_sub_manufacturers}")

        expect(page).to have_content("Favorite manufacturer: #{gm.favorite_manufacturer}")
        expect(page).to have_content("Favorite manufacturer: #{ferrari.favorite_manufacturer}")
        expect(page).to have_content("Favorite manufacturer: #{rivian.favorite_manufacturer}")
      end

      it "Then I see the attributes of each manufacturer in the system" do
        gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
        ferrari = Manufacturer.create!(name: 'Ferrari', number_of_sub_manufacturers: 1 , favorite_manufacturer: false)
        rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)


      end
      
    end

    
  end