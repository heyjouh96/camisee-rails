Rails.application.routes.draw do
  resources :departamentos
  # get "produtos" => "produtos#index"
  root "produtos#index"
  # get "/produtos/new" => "produtos#new"
  # post "/produtos" => "produtos#create"
  # delete "/produtos/:id" => "produtos#delete", as: :produto
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
  get "produtos/:id" => "produtos#show", as: :show_produto
  
  get "/usuarios" => "usuarios#index"
  get "/usuarios/new" => "usuarios#new"
  post "/usuarios" => "usuarios#create"
end