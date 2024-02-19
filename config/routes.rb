Rails.application.routes.draw do
  # 9章でコメントアウト
  # get 'postimages/new'
  # get 'postimages/index'
  # get 'postimages/show'
  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about" #なんでこっち？？
  # get 'about' => 'homes#about' ここ間違い！理由探す！7章のAboutページ作成の内容
  # get 'homes/about'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do #9章で追加→10章でcreate追加, 13章でdestroy追加
    resource :favorite, only: [:create, :destroy] #19章(いいね機能のルーティング設定)
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
