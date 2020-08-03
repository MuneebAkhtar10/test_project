Rails.application.routes.draw do
 
  get 'dashboard/index'
  devise_for :users
  root 'dashboard#index'

	# get 'assign_project_to_developer', to: 'projects#assign_project_to_developer'
	# get  'add_developer' ,to: 'projects#add_developer'
	get 'take_bug_developer', to: 'bugs#take_bug_developer'

  shallow do
  	resources :projects do
			member do
				get 'bugs'
				get 'assign_project_to_developer'
				get 'add_developer'
				get 'remove_developer'
			end	
			resources :bugs
				member do
			end
		end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
