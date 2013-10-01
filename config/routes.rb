Prizeboard::Application.routes.draw do

  root to:'categories#index'

  match 'prizeboard/' => 'prizeboard#index'

  resources :categories do
    resources :prizes
  end

end
