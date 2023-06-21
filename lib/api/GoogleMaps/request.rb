module Api
  module GoogleMaps
    class Request
      attr_accessor :query
      require 'uri'
      require 'net/http'
      require 'addressable/uri'
      require 'active_support/core_ext'

      def initialize(query)
        @params = {
          address: query['pref'].to_s + query['city'].to_s,
          key: ENV['GOOGLE_MAP_API_KEY']
        }
      end

      # グーグルマップAPI - 住所から緯度経度を出力
      def request(query)
        params = {
          key: ENV['GOOGLE_MAP_API_KEY']
        }

        url = Addressable::URI.parse ENV['GOOGLE_MAP_API']
        url_query = params.to_param
        url = url.to_s + '?' + url_query.to_s
        url += "&address=" + @params[:address]
        puts url

        client = HTTPClient.new
        response = client.get(url)
        res_json = JSON.parse(response.body)
        puts "API情報:" + url
        res_json["results"][0]["geometry"]["location"]
      end

      private
    end
  end
end