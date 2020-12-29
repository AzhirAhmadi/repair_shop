module Api::V1
  class ShopsController < ApplicationController
    def show
      render json: current_user.shop
    end
    
    def update
      if current_user.shop.update(permited_params)
        render json: current_user.shop
      else
        render json: current_user.shop.errors.messages
      end
    end

    private
    def permited_params
      params.required(:shop).permit(:name)
    end
  end
end