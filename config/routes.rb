Rails.application.routes.draw do

  root 'welcome#index'



  get 'static_pages/webdesign'

  get 'static_pages/schermreparatie'

  get 'static_pages/datarecovery'

  get 'static_pages/pchulp'

  get 'users/dashboard'

  devise_for :users
    root 'welcome#index'

  resources :articles do
    resources :comments
  end

  post 'articles/new'
end
