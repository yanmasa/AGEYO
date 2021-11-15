Rails.application.routes.draw do
  devise_for :recipients, skip: [:registrations,:passwords], controllers: {
    sessions: 'recipient/sessions'
  }
  devise_for :contributors, skip: [:passwords], controllers: {
    registrations: 'contributor/registrations',
    sessions: 'contributor/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
  post 'contacts/back' => 'contacts#back', as: 'back'
  get 'done' => 'contacts#done',as: 'done'
  get '/about' => 'homes#about', as: 'about'

  namespace :contributor do
    resource :contributors do
      member do
        get :quit
        patch :out
      end
    end
    resources :posts
  end

  scope module: :recipient do
    resources :recipients do
      get 'favorites' => 'favorites#index'
      get 'follows' => 'relationships#follows', as: 'follows'
    end
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resource :requests, only: [:create]
    end
    resources :contributors do
      resource :relationships, only: [:create, :destroy]
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end


  resources :rooms, only: [:show, :create] do
    resources :messages, only: [:create]
  end
end
