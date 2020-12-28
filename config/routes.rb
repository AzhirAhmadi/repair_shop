Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        namespace :auth do
          post   '/signin',       to: 'sessions#create'
          delete '/signout',      to: 'sessions#destroy'
        end
      end
    end
  end
end
