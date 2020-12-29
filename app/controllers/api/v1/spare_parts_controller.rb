module Api::V1
  class SparePartsController < ApplicationController
    def index
      render json: model
    end
    
    def show
      render json: model.find_by_id(params[:id])
    end
    
    def create
      spare_part = model.new(permited_params)

      if spare_part.save
        render json: spare_part
      else
        render json: spare_part.errors.messages
      end
    end

    def update
      spare_part = model.find_by_id(params[:id])

      if spare_part.update(permited_params)
        render json: spare_part
      else
        render json: spare_part.errors.messages
      end
    end

    def destroy
      spare_part = model.find_by_id(params[:id])

      if spare_part.destroy
        render json: spare_part
      else
        render json: spare_part.errors.messages
      end
    end

    private
    
    def shop
      @shop || current_user.shop
    end

    def customer
      @customer || shop.customers.find_by_id(params[:customer_id])
    end

    def car
      @car || customer.cars.find_by_id(params[:car_id])
    end

    def repair
      @car || car.repairs.find_by_id(params[:repair_id])
    end

    def model
      @spare_parts || repair.spare_parts
    end

    def permited_params
      @permited_params || params.required(:spare_part).permit(:name, :cost, :serial_number)
    end
  end
end
