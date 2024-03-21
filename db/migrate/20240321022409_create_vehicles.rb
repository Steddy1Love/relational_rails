class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.boolean :favorite_type
      t.integer :number_of_cylinders

      t.timestamps
    end
  end
end
