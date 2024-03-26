# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
gm = Manufacturer.create!(name: 'GM', number_of_sub_manufacturers: 4, favorite_manufacturer: true)
rivian = Manufacturer.create!(name: 'Rivian', number_of_sub_manufacturers: 1, favorite_manufacturer: false)
ferrari = Manufacturer.create!(name: 'Ferrari', number_of_sub_manufacturers: 1 , favorite_manufacturer: false)
ct4 = gm.vehicles.create!(name: 'CT4', favorite_type: true, number_of_cylinders: 6)
zl1 = gm.vehicles.create!(name: 'ZL1', favorite_type: false, number_of_cylinders: 8)
r2 = rivian.vehicles.create!(name: 'R2', favorite_type: false, number_of_cylinders: 0)
gto = ferrari.vehicles.create!(name: '599 GTO', favorite_type: false, number_of_cylinders: 12)