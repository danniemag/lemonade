Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: 'offers#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  resources :offers do
    put :enable, param: :id
    put :disable, param: :id
    put :enable_please
    put :disable_please
    get :cashback
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
