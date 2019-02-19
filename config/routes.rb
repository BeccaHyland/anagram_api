Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :words, only: [:create, :destroy]
      resources :anagrams, only: [:show]
    end
  end

  delete '/api/v1/words', to: 'api/v1/words#destroy_all'
end
