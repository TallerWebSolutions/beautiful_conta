Rails.application.routes.draw do
  	devise_for :users
  	
  	root 'dashboard#index'
  	resources :messages
  	resources :contacts
  	resources :services
  	resources :documents
	resources :users
	resources :teams  
	resources :clients
	resources :contents
	resources :crm 
	get :robot, to: 'robot#show'
	put :robot, to: 'robot#update'
	patch :robot, to: 'robot#update'

	namespace :api, constraints: { format: :json } do
	    namespace :v1 do
	    	post 'user_token', to: 'user_token#create'
	    	post :register, to: 'me#create'
	    	post :forgot_password, path: 'forgot-password', to: 'me#forgot_password'
	    	resources :me, controller: 'me'
	    	resources :business, controller: 'business'
	    	resources :events, controler: 'events' do
	    		post :confirm, to: 'events#confirm'
			end
			resources :contents, controller: 'contents'
	    	resources :wallet, controller: 'wallet'
	    	resources :documents, controller: 'documents'
			resources :clients, controller: 'clients'
			resources :users, controller: 'users'
			resources :services, controller: 'services'
			namespace :admin do
				get :dashboard, to: 'dashboard#index'
				resources :clients
				resources :contents
				resources :users
				resources :services
				resources :messages
				resources :crm
			end
	    end
	end

  
end
