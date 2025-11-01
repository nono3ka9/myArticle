Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
# ヘルスチェック用
  get "up" => "rails/health#show", as: :rails_health_check
# ルートパス（任意）
  root "articles#index"
end