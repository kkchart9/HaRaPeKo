module Api
  module Recruit
    class Request
      attr_accessor :query

      def initialize(query)
        @query = query
      end
    end
  end
end