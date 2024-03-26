require "rails_helper"

RSpec.describe "Manufacturer Show Page", type: :feature do
  before :each do
    @gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
    @ferrari = Manufacturer.create!(name: 'Ferrari', number_of_sub_manufacturers: 1 , favorite_manufacturer: false)
    @rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)
    @ct4 = @gm.vehicles.create!(name: 'CT4', favorite_type: true, number_of_cylinders: 6)
    @zl1 = @gm.vehicles.create!(name: 'ZL1', favorite_type: false, number_of_cylinders: 8)
    @r2 = @rivian.vehicles.create!(name: 'R2', favorite_type: false, number_of_cylinders: 0)
    @gto = @ferrari.vehicles.create!(name: '599 GTO', favorite_type: false, number_of_cylinders: 12)
  end
  
  it "Then I see the attributes of one manufacturer in the system" do
    visit "/manufacturers/#{@gm.id}"

    expect(page).to have_content("#{@gm.name}")
    expect(page).to_not have_content("#{@rivian.name}")
    expect(page).to have_content("Number of sub manufacturers: #{@gm.number_of_sub_manufacturers}")
    expect(page).to have_content("Favorite manufacturer: #{@gm.favorite_manufacturer}")
    expect(page).to have_content("Created at: #{@gm.created_at}")
    expect(page).to have_content("Updated at: #{@gm.updated_at}")
  end
   # User Story 10, Parent Child Index Link
    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it "Then I see a link to the vehicles for a particular manufacturer" do
    visit "/manufacturers/#{@gm.id}"
    click_on("All vehicles per #{@gm.name}")

    expect(current_path).to eq("/manufacturers/#{@gm.id}/vehicles")
    expect(page).to have_content("Name: #{@zl1.name}")
  end
end