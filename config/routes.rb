Rails.application.routes.draw do
devise_for :users
root 'blogs#index'
# resource :home,:blogs,:post,:comment

resources :blogs do
	resources :posts do
		get 'verify', on: :member
		post 'verify', on: :member
		resources :comments
	end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end