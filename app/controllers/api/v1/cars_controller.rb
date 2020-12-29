module Api::V1
  class CarsController < ApplicationController
    def index
      render json: customer.cars
    end
    
    def show
      render json: customer.cars.find_by_id(params[:id])
    end
    
    def create
      car = customer.cars.new(permited_params)

      if car.save
        render json: car
      else
        render json: car.errors.messages
      end
    end

    def update
      car = customer.cars.find_by_id(params[:id])

      if car.update(permited_params)
        render json: car
      else
        render json: car.errors.messages
      end
    end

    def destroy
      car = customer.cars.find_by_id(params[:id])

      if car.destroy
        render json: car
      else
        render json: car.errors.messages
      end
    end

    private
    
    def shop
      @shop || current_user.shop
    end

    def customer
      @customer || shop.customers.find_by_id(params[:customer_id])
    end

    def permited_params
      @permited_params || params.required(:customer).permit(:number, :car_type)
    end
  end
end
