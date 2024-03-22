class ManufacturersController < ApplicationController
  attr_reader :manu_list

    def index
        @manufacturers = Manufacturer.all
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

    def manufacturer_list
      @manu_list = @manufacturers.each do |manufacturer| 
        manu_name = manufacturer.name
        sub_manufacturers = manufacturer.number_of_sub_manufacturers
        favorite = manufacturer.favorite_manufacturer
        created = manfacturer.created_at
      end
      
    end

    def ordered_list
      @manu_list.sort_by!{|manufacturer| manfacturer. binding.pry}
    end
end