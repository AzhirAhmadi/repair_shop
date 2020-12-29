module Api::V1
  class CustomersController < ApplicationController
    def index
      render json: shop.customers
    end
    
    def show
      render json: shop.customers.find_by_id(params[:id])
    end
    
    def create
      customer = shop.customers.new(permited_params)

      if customer.save
        render json: customer
      else
        render json: customer.errors.messages
      end
    end

    def update
      customer = shop.customers.find_by_id(params[:id])

      if customer.update(permited_params)
        render json: customer
      else
        render json: customer.errors.messages
      end
    end

    def destroy
      customer = shop.customers.find_by_id(params[:id])

      if customer.destroy
        render json: customer
      else
        render json: customer.errors.messages
      end
    end

    private
    
    def shop
      @shop || current_user.shop
    end

    def permited_params
      params.required(:customer).permit(:name, :mobile_number)
    end
  end
end
