Rails.application.routes.draw do
  namespace :api, as: nil do
    devise_for :users, skip: :all
    devise_scope :user do
      post 'sign_in', to: 'sessions#create'
      delete 'sign_out', to: 'sessions#destroy'
      post 'reset_password', to: 'passwords#reset'
      patch 'password', to: 'passwords#update'
    end

    resources :users, only: [] do
      collection do
        get 'me'
      end
    end

  end
end
