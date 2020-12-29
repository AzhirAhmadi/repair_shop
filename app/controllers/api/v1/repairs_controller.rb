module Api::V1
  class RepairsController < ApplicationController
    def index
      render json: car.repairs
    end
    
    def show
      render json: car.repairs.find_by_id(params[:id])
    end
    
    def create
      repair = car.repairs.new(permited_params)

      if repair.save
        render json: repair
      else
        render json: repair.errors.messages
      end
    end

    def update
      repair = car.repairs.find_by_id(params[:id])

      if repair.update(permited_params)
        render json: repair
      else
        render json: repair.errors.messages
      end
    end

    def destroy
      repair = car.repairs.find_by_id(params[:id])

      if repair.destroy
        render json: repair
      else
        render json: repair.errors.messages
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

    def permited_params
      @permited_params || params.required(:repair).permit(:description, :kilometer)
    end
  end
end
