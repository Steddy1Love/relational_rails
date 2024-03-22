class ManufacturerVehiclesController < ApplicationController
  def index
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @vehicles = @manufacturer.vehicles
  end
end