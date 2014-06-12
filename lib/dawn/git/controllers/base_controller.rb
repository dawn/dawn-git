require "json"
require "sinatra/base"

module Dawn
  module Git
    class BaseController < Sinatra::Base

      attr_reader :params
      attr_reader :body_data
      attr_reader :request
      attr_reader :response

      def action(name, request, response, params={})
        @request = request
        @response = response
        @params = params
        @body_data = JSON.load(request.body)

        content_type :json

        send name
      end

      helpers do
        def json(data)
          response.body = data.to_json
        end
      end

      def self.action(name)
        lambda do |request, response, params={}|
          # now this is a hack I'd rather avoid, but...
          # The request and response bodies are passed from the original
          # route block into the controller
          # The call! method is avoided, since it will overwrite the
          # response/request objects, so instead an action method was created
          # to perform the same job.
          # When control is returned to the route caller it will finalize
          # the response and all should/will be well.
          # Controller Middleware trickery!
          new!.action(name, request, response, params)
        end
      end

    end
  end
end
