module Api::V1
  class ShopsController < ApplicationController
    def show
      render json: model
    end
    
    def update
      if model.update(permited_params)
        render json: model
      else
        render json: model.errors.messages
      end
    end

    private
    
    def model
      @model || current_user.shop
    end

    def permited_params
      params.required(:shop).permit(:name)
    end
  end
end