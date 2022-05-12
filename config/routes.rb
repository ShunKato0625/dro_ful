Rails.application.routes.draw do
  root 'public/homes#top'
  scope module: :public do
    resource :customers, only: [:edit, :update] do
      get 'my_page' => 'customers#show'
      get 'unsubscribe' => 'customers#unsubscribe'
      patch 'withdraw' => 'customers#withdraw'
    end
  end
  # 顧客用
  devise_for :customers,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update] do
      get 'post_index' => 'customers#post_index'
    end
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
      resources :post_comments, only: [:index, :create, :destroy]
    get 'search'=> 'searches#search'
  end

  scope module: :public do

    get 'homes/about'
    resources :posts do
      resources :post_comments, only: [:index, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'search' => 'searches#search'
  end

end
