module Api::V1
  class CarsController < ApplicationController
    def index
      render json: model
    end
    
    def show
      render json: model.find_by_id(params[:id])
    end
    
    def create
      car = model.new(permited_params)

      if car.save
        render json: car
      else
        render json: car.errors.messages
      end
    end

    def update
      car = model.find_by_id(params[:id])

      if car.update(permited_params)
        render json: car
      else
        render json: car.errors.messages
      end
    end

    def destroy
      car = model.find_by_id(params[:id])

      if car.destroy
        render json: car
      else
        render json: car.errors.messages
      end
    end

    private

    def model
      @model || (current_user.shop
      .customers.find_by_id(params[:customer_id])
      .cars)
    end

    def permited_params
      @permited_params || params.required(:car).permit(:number, :car_type)
    end
  end
end
