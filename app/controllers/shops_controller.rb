class ShopsController < ApplicationController

  def input
    @ranges = ['300m', '500m', '1000m', '2000m', '3000m']
  end

  def search
    query = shops_search_params

    # 場所指定があった場合の対応
    if query[:pref] != "都道府県を指定する"
      open_google_maps = Api::GoogleMaps::Request.new(query)
      location = open_google_maps.request(query)
      query[:latitude] = location["lat"]
      query[:longitude] = location["lng"]
    end
    open_recruit = Api::Recruit::Request.new(query)
    @response = open_recruit.request(query)
    render "result"
  end

  def show
    query = params[:id]
    open_recruit = Api::Recruit::Request.new(query)
    @response = open_recruit.shop_id_request(query)
  end

  private
  def shops_search_params
    params.permit(:store_name, :latitude, :longitude, :range, :pref, :city)
  end


end
