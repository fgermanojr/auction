Rails.application.routes.draw do
  resources :auction_news
  match 'submission/upload' => 'submissions#upload', :via => :get #submission_upload_path
  match 'auction_new/bulkload' => 'auction_news#bulkload', :via => :post #auction_bulkload_path
  match 'auction_new/summary' => 'auction_news#summary', :via => :get
end
