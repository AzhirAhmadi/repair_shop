module Api::V1
  class UsersController < ApplicationController
    def update
      if current_user.update(permited_params)
        render json: current_user
      else
        render json: current_user.errors.messages
      end
    end

    def profile
      render json: current_user
    end

    private
    def permited_params
      params.required(:user).permit(:email)
    end
  end
end