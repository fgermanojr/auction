json.extract! auction_news, :id, :created_at, :updated_at
json.url auction_news_url(auction_news, format: :json)
