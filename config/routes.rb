Rails.application.routes.draw do
  root "articles#index"  # Kök URL yönlendirmesi

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
end

