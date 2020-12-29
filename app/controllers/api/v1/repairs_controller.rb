module Api::V1
  class RepairsController < ApplicationController
    def index
      render json: model
    end
    
    def show
      render json: model.find_by_id(params[:id])
    end
    
    def create
      repair = model.new(permited_params)

      if repair.save
        render json: repair
      else
        render json: repair.errors.messages
      end
    end

    def update
      repair = model.find_by_id(params[:id])

      if repair.update(permited_params)
        render json: repair
      else
        render json: repair.errors.messages
      end
    end

    def destroy
      repair = model.find_by_id(params[:id])

      if repair.destroy
        render json: repair
      else
        render json: repair.errors.messages
      end
    end

    private

    def model
      @model || (current_user.shop
        .customers.find_by_id(params[:customer_id])
        .cars.find_by_id(params[:car_id])
        .repairs)
    end

    def permited_params
      @permited_params || params.required(:repair).permit(:description, :kilometer)
    end
  end
end
