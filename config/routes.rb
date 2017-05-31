Rails.application.routes.draw do
  root to: 'mailboxes#index'
  resources :mailbox_messages do
    member do
      get :publish  #TODO: get to post
    end
  end
  resources :mailboxes
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
