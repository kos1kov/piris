Rails.application.routes.draw do
  root 'users#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  post 'login' => 'atm#login', as: 'login'
  # get 'newdeposit' => 'deposit#new', as: 'newdeposit'
  # patch 'closeBankDay' => 'deposits#index', as: 'closeBankDay'

  resources :deposits
  resources :credits
  resources :credit_plans
  resources :users do
    resources :comments
  end
  resources :atm
end
