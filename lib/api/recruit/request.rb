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
          shop_id: query['id'],
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

        url = create_url(params)

        store_name = query['store_name']
        url+= "&name=" + store_name

        client = HTTPClient.new
        response = client.get(url)
        res_json = JSON.parse(response.body)
        res_json
      end

      def shop_id_request(shop_id)
        params = {
          :key => ENV['RECRUIT_API_KEY'],
          :format => 'json',
          :id => shop_id
        }

        url = create_url(params)
        client = HTTPClient.new
        response = client.get(url)
        res_json = JSON.parse(response.body)
        res_json
      end

      private
      def create_url(params)
        url = Addressable::URI.parse ENV['GOURMET_SEARCH_API']
        url_query = params.to_param
        url = url.to_s + '?' + url_query.to_s

        url.to_s
      end
    end
  end
end