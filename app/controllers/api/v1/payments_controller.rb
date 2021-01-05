module Api::V1
  class PaymentsController < ApplicationController
    def index
      render json: model
    end
    
    def show
      render json: model.find_by_id(params[:id])
    end
    
    def create
      payment = model.new(permited_params)

      if payment.save
        render json: payment
      else
        render json: payment.errors.messages
      end
    end

    def update
      payment = model.find_by_id(params[:id])

      if payment.update(permited_params)
        render json: payment
      else
        render json: payment.errors.messages
      end
    end

    def destroy
      payment = model.find_by_id(params[:id])

      if payment.destroy
        render json: payment
      else
        render json: payment.errors.messages
      end
    end

    private

    def model
      @model || (current_user.shop
        .customers.find_by_id(params[:customer_id])
        .cars.find_by_id(params[:car_id])
        .repairs.find_by_id(params[:repair_id])
        .payments)
    end

    def permited_params
      @permited_params || params.required(:payment).permit(:value)
    end
  end
end
