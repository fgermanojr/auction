class AuctionNewsController < ApplicationController
  before_action :set_auction_news, only: [:show, :edit, :update, :destroy]

  def bulkload
    # extract filename
    # process file, rows to auction
    file_path = auction_news_params[:csv_file].tempfile.path
puts file_path

    fileObj = File.new(file_path, "r")
    headers = fileObj.gets
    check_line(headers)

    while (line = fileObj.gets)
      result = process_line(line)
    end
    fileObj.close
# TBD check errors

    @auction_news = AuctionNew.all # Should do itself in controller ???
    # redirect_to auction_news_index_url
    # redirect_to '/auction_news'
    redirect_to url_for(:controller => 'auction_news', :action => 'index')
  end

  def check_line(line)å
    arry = line.split(',')
    fail 'BadInput' if arry.count != 6
    arry
  end

  def process_line(line)
    line_arry = check_line(line)
    auction_new = AuctionNew.new

    auction_new.name = line_arry[0]
    auction_new.city = line_arry[1]
    auction_new.vehicle_desc = line_arry[2]
    auction_new.vehicle_vin = line_arry[3]
    auction_new.winning_bid = line_arry[4]
    auction_new.seller_payout = line_arry[5]
    auction_new.profit = auction_new.winning_bid - auction_new.seller_payout
    auction_new.save!
  end

  # GET /auction_news
  # GET /auction_news.json
  def index
    @auction_news = AuctionNew.all
    render 'index'
  end

  def summary
    @auction_news_summary = AuctionNew.select('name', 'city',
       'count(id) as vehicle_count',
        'sum(profit) as profit_sum',
         'avg(profit) as profit_avg').group('name')
    render 'summary'
  end

  # GET /auction_news/1
  # GET /auction_news/1.json
  def show
  end

  # GET /auction_news/new
  def new
    @auction_news = AuctionNew.new
  end

  # GET /auction_news/1/edit
  def edit
  end

  # POST /auction_news
  # POST /auction_news.json
  def create
    @auction_news = AuctionNew.new(auction_news_params)

    respond_to do |format|
      if @auction_news.save
        format.html { redirect_to @auction_news, notice: 'Auction new was successfully created.' }
        format.json { render :show, status: :created, location: @auction_news }
      else
        format.html { render :new }
        format.json { render json: @auction_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auction_news/1
  # PATCH/PUT /auction_news/1.json
  def update
    respond_to do |format|
      if @auction_news.update(auction_news_params)
        format.html { redirect_to @auction_news, notice: 'Auction new was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction_news }
      else
        format.html { render :edit }
        format.json { render json: @auction_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auction_news/1
  # DELETE /auction_news/1.json
  def destroy
    @auction_news.destroy
    respond_to do |format|
      format.html { redirect_to auction_news_url, notice: 'Auction new was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_auction_news
    @auction_news = AuctionNew.find(params[:id])
  end

  def auction_news_params
    params.require(:auction_new).permit(:csv_file)
  end
end
