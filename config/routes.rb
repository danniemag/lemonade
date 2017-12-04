Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: 'offers#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  resources :offers do
    put :enabler
    put :disabler
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
