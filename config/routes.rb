Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
