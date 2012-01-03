Fleet::Application.routes.draw do

  scope '(:locale)' do
    resources :locations
    root :to => 'locations#index'
  end

end
