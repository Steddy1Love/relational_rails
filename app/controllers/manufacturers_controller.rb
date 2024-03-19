class ManufacturersController < ApplicationController
    def index
        @manufacturers = ["Cadillac", "Ferrari", "Rivian"]
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
end