Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  devise_for :users, controllers: {
    confirmations:      'users/confirmations',
    # omniauth_callbacks: 'users/omniauth_callbacks',
    passwords:          'users/passwords',
    registrations:      'users/registrations',
    sessions:           'users/sessions',
    unlocks:            'users/unlocks',
  }
end
