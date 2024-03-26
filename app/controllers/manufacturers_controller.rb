class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(created_at: :asc)
  end

  # def new
  # end

  # def create
  #     manufacturer = Manufacturer.new({
  #         name: params[:name]
  #         number_of_sub_manufacturers: params[:number_of_sub_manufacturers]
  #         favorite_manufacturer: params[:favorite_manufacturer]
  #     })

  #     manufacturer.save

  #     redirect_to '/manfacturers'
  # end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  # def edit
  #     @manfacturers = Manufacturer.find(params[:id])
  # end

  # def update
  #     manufacturers = Manufacturer.find(params[:id])
  #     manufacturers.update({
  #         name: params[:manufacturers][:name],
  #         number_of_sub_manufacturers:  params[:manufacturers][:number_of_sub_manufacturers],
  #         favorite_manufacturer: params[:manufacturers][:favorite_manufacturer]
  #     })
  # end

end