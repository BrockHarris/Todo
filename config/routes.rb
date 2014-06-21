TodoApp::Application.routes.draw do

  resources :todos do
	  member do
	    post :toggle
	  end
	end

  root to: 'todos#index'

	match '/todos/:id/toggle', to: 'todos#toggle'
end
