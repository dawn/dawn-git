require "json"
require "sinatra/base"

module Dawn
  module Git
    class BaseController

      include Sinatra::Helpers
      include Sinatra::Templates

      attr_reader :params
      attr_reader :request
      attr_reader :response

      def call(request, response, name, params={})
        @request = request
        @response = response
        @params = Hash[params]
        send name
      end

      def json(data)
        response.body = data.to_json
      end

      def self.action(name)
        ->(request, response, params={}) { new.call(request, response, name, params) }
      end

    end
  end
end
