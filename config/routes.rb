Prizeboard::Application.routes.draw do

  root to:'categories#index'
  post 'update_prize/:id', to: 'prizeboard#update', as: "update_prizeboard_prize"

  resources :categories do
    resources :prizes
  end

  resources :prizeboard, only: [:index, :show]

end
