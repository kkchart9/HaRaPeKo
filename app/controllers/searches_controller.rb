class SearchesController < ApplicationController

  def input
    @ranges = ['300m', '500m', '1000m', '2000m', '3000m']
  end

  def search
    query = store_search_params
    open_recruit = Api::Recruit::Request.new(query)
    @response = open_recruit.request(query)
    puts @response
    render "result"
  end

  private
  def store_search_params
    params.permit(:store_name, :latitude, :longitude, :range)
  end

end
