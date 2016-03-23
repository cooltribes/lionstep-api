Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations:      'v1/authentication/registrations',
    sessions:           'v1/authentication/sessions',
    token_validations:  'v1/authentication/token_validations'
  }

  devise_scope :user do
    post '/auth/provider', to: "v1/authentication/sessions#provider"
  end

  api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.lionstep.com; version=1"}) do
    actions = [:index, :show, :create, :update, :destroy]

    concern :albumable do
      resources :albums, only: actions
    end

    resources :users, only: actions do

      resource :profile, only: [:show, :update], module: 'users'

      resources :contacts, only: actions, module: 'users' do
        post :batch, on: :collection
      end

      resources :professional_experiences, only: actions, module: 'users'

      resources :academic_experiences, only: actions, module: 'users'

      resources :skills, only: actions, module: 'users'

      resources :languages, only: actions, module: 'users'

      resources :albums, only: actions, module: 'users'

      resources :extra_activities, only: actions, module: 'users'

    end

    scope 'albums/:album_id', as: 'album' do
      resources :pictures, only: actions, module: 'albums'
    end

    post 'pictures', to: 'pictures#create'
    put 'tests', to: 'tests#update'
    get 'tests/results', to: 'tests#results'
    get 'tests/step/:step', to: 'tests#step'

    get 'countries', to: 'countries#index'
    get 'countries/:country_code/cities', to: 'countries#show'

    get 'languages', to: 'languages#index'
    get 'universities', to: 'universities#index'
    get 'sectors', to: 'sectors#index'
    get 'skills', to: 'skills#index'
  end
end
