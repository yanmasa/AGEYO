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
end
