class SearchesController < ApplicationController

  def input
  end

  def search
    puts params["store_name"]
    puts "================"
    @res = params["store_name"]
    tmp_res = Api::Recruit::Request.new(12345)
    puts tmp_res.query
    render "result"
  end

end
