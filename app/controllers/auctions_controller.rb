class AuctionsController < ApplicationController
  def bulkload
    # extract filename
    # process file, rows to auction
    file_path = auction_params[:csv_file].tempfile.path

    fileObj = File.new(file_path, "r")
    headers = fileObj.gets
    check_line(headers)

    while (line = fileObj.gets)
puts(line)
      process_line(line)
    end
    fileObj.close
# check errors
    binding.pry
  end

  private

  def auction_params
    params.require(:auction).permit(:csv_file)
  end

  def check_line(line)
    arry = line.split(',')
    fail 'BadInput' if arry.count != 6
    arry
  end

  def process_line(line)
    line_arry = check_line(line)
    auction = Auction.new # FAILING .new not defined on auction module???

    auction.name = line_arry[0]
    auction.city = line_arry[1]
    auction.vehicle_desc = line_arry[2]
    auction.vehicle_vin = line_arry[3]
    auction.winning_bid = line_arry[4]
    auction.seller_payout = line_arry[5]
    auction.profit = auction.winning_bid - auction.seller_payout
    auction.save!
  end
end
