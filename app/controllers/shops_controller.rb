class ShopsController < ApplicationController

  def input
    @ranges = ['300m', '500m', '1000m', '2000m', '3000m']
  end

  def search
    query = shops_search_params
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
    params.permit(:store_name, :latitude, :longitude, :range)
  end


end
