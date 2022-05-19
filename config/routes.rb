Rails.application.routes.draw do

  # 顧客用
  devise_for :customers,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root 'public/homes#top'

  scope module: :public do
    resources :customers, only: [:index, :show, :edit, :update] do
      get 'my_page' => 'customers#mypage'
      patch 'withdraw' => 'customers#withdraw'
    end
    get 'search_customer'=> 'searches#search_customer'
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update] do
    end
    get 'search_customer'=> 'searches#search_customer'
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:index, :create, :destroy]
    end
    get 'search_post'=> 'searches#search_post'
  end

  scope module: :public do
    get 'homes/about'
    resources :posts do
      resources :post_comments, only: [:index, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'search_post'=> 'searches#search_post'
  end

end
