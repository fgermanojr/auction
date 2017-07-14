class CreateAuctionNews < ActiveRecord::Migration[5.1]
  def change
    create_table :auction_news do |t|
      t.string :name
      t.string :city
      t.string :vehicle_desc
      t.string :vehicle_vin
      t.decimal :winning_bid, precision:8, scale:2
      t.decimal :seller_payout,  precision:8, scale:2
      t.decimal :profit, precision:8, scale:2
      t.timestamps
    end
  end
end
