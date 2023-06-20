module Api
  module Recruit
    class Request
      attr_accessor :query
      require 'uri'
      require 'net/http'
      require 'addressable/uri'
      require 'active_support/core_ext'

      def initialize(query)

        @params = {
          name: query['store_name'],
          key: ENV['RECRUIT_API_KEY'],
          lat: query['latitude'],
          lng: query['longitude'],
          range: query['range'],
          format: 'json',
        }
      end

      # グルメリサーチAPI - {場所, 店名, 範囲}
      def request(query)
        params = {
          :key => ENV['RECRUIT_API_KEY'],
          :lat => query['latitude'],
          :lng => query['longitude'],
          :range => query['range'],
          :format => 'json',
          :count => 50
        }

        client = HTTPClient.new
        url = Addressable::URI.parse ENV['GOURMET_SEARCH_API']
        puts url
        url_query = params.to_param
        store_name = query['store_name']
        url_query += "&name=" + store_name
        url = url.to_s + '?' + url_query.to_s

        response = client.get(url)
        res_json = JSON.parse(response.body)
        res_json
      end


    end
  end
end