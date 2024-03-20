class CreateManufacturers < ActiveRecord::Migration[7.1]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.integer :number_of_sub_manufacturers
      t.boolean :favorite_manufacturer

      t.timestamps
    end
  end
end
