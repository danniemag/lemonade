Rails.application.routes.draw do
  resources :offers do
    put :enable, param: :id
    put :disable, param: :id
    put :enable_please
    put :disable_please
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
