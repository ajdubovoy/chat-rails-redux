Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :channels, only: [ :index ] do
        resources :messages, only: [ :index, :create ]
      end
    end
  end

  devise_for :users
  resources :channels, only: [ :show ]
  root to: 'channels#show'
end
