Rails.application.routes.draw do

  Sidekiq::Web.use(Rack::Auth::Basic) do |username, password|
    username == ENV["SIDEKIQ_USER_NAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end
  mount(Sidekiq::Web => "/sidekiq")

  root "posts#index"
  resources :posts
end
