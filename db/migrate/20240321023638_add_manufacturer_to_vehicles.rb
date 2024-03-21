class AddManufacturerToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_reference :vehicles, :manufacturer, null: false, foreign_key: true
  end
end
