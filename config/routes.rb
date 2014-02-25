Intercom::Application.routes.draw do

  resources :users, only: [:index, :create] do
    resources :messages, only: [:index, :new, :create]
    get 'messages/unread' => 'messages#unread'
  end

  root to: 'users#index'
end

#        user_messages GET  /users/:user_id/messages(.:format)        messages#index
#                      POST /users/:user_id/messages(.:format)        messages#create
#     new_user_message GET  /users/:user_id/messages/new(.:format)    messages#new
# user_messages_unread GET  /users/:user_id/messages/unread(.:format) messages#unread
#                users GET  /users(.:format)                          users#index
#                      POST /users(.:format)                          users#create
#                 root      /                                         users#index
