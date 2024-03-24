require "rails_helper"

RSpec.describe "Manufacturer Vehicle Index", type: :feature do
  before :each do
    @gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
    @rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)
    @ferrari = Manufacturer.create!(name: 'Ferrari', number_of_sub_manufacturers: 1 , favorite_manufacturer: false)
    @ct4 = @gm.vehicles.create!(name: 'CT4', favorite_type: true, number_of_cylinders: 6)
    @zl1 = @gm.vehicles.create!(name: 'ZL1', favorite_type: false, number_of_cylinders: 8)
    @r2 = @rivian.vehicles.create!(name: 'R2', favorite_type: false, number_of_cylinders: 0)
    @gto = @ferrari.vehicles.create!(name: '599 GTO', favorite_type: false, number_of_cylinders: 12)
  end

  it 'Then I see each vehicle that is associated with that manufacturer with each vehicles attributes' do
    visit "/manufacturers/#{@gm.id}/vehicles"
    
    expect(page).to have_content("Name: #{@ct4.name}")
    expect(page).to have_content("Favorite type: #{@ct4.favorite_type}")
    expect(page).to have_content("Pistons?: #{@ct4.number_of_cylinders}")
    expect(page).to have_content("Created at: #{@ct4.created_at}")
    expect(page).to have_content("Updated at: #{@ct4.updated_at}")
    expect(page).to have_content("Name: #{@zl1.name}")
    expect(page).to have_content("Favorite type: #{@zl1.favorite_type}")
    expect(page).to have_content("Pistons?: #{@zl1.number_of_cylinders}")
    expect(page).to have_content("Created at: #{@zl1.created_at}")
    expect(page).to have_content("Updated at: #{@zl1.updated_at}")
  end
  
  it 'Then I see a count of the number of vehicles associated with the manufacturer' do
    visit "/manufacturers/#{@gm.id}/vehicles"
    save_and_open_page
    expect(page).to have_content("Number listed: #{@gm.vehicles.count}")
  end
end
