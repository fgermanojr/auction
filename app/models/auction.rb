class Auction < ActiveRecord
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :city, presence: true
  validates :city, length: { maximum: 20 }
  validates :vehicle_vin, presence: true
  validates :winning_bid, :seller_payout, :profit
    numericality: { greater_than_or_equal_to: 0 }
end