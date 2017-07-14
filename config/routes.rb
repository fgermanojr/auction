Rails.application.routes.draw do
  match 'submission/upload' => 'submissions#upload', :via => :get
  match 'auction/bulkload' => 'auctions#bulkload', :via => :post
  # resources :auctions # CRUD actions
end
