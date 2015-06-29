Rails.application.routes.draw do


#	scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
	  root to: 'visitors#index'
	  devise_for :users
	  resources :users

	  resources :individuals do
	    post 'datatables_index', on: :collection
  		get 'export', on: :collection
	  end

	  resources :clubs do
	    post 'datatables_index', on: :collection
	  end

	  resources :individual_mf_devices do
	    post 'datatables_index', on: :collection
	  end

	  resources :club_mf_devices do
	    post 'datatables_index', on: :collection
	  end


#	end

#	get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
#	get '', to: redirect("/#{I18n.default_locale}/")

end
