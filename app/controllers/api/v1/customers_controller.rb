module Api::V1
  class CustomersController < ApplicationController
    def index
      render json: model
    end
    
    def show
      render json: model.find_by_id(params[:id])
    end
    
    def create
      customer = model.new(permited_params)

      if customer.save
        render json: customer
      else
        render json: customer.errors.messages
      end
    end

    def update
      customer = model.find_by_id(params[:id])

      if customer.update(permited_params)
        render json: customer
      else
        render json: customer.errors.messages
      end
    end

    def destroy
      customer = model.find_by_id(params[:id])

      if customer.destroy
        render json: customer
      else
        render json: customer.errors.messages
      end
    end

    private
    
    def model
      @model || current_user.shop.customers
    end

    def permited_params
      params.required(:customer).permit(:name, :mobile_number)
    end
  end
end
