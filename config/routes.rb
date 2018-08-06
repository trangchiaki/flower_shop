Rails.application.routes.draw do
  get "flowers/index"
  get "flowers/new"
  get "flowers/show"
  get "flowers/edit"
  resources :flowers
  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    get "/product", to: "static_pages#product"
  end
end
