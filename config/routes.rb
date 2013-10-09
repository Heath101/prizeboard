Prizeboard::Application.routes.draw do

  root to:'categories#index'

  resources :categories do
    resources :prizes
  end

  resources :prizeboard, only: [:index, :show]

end
