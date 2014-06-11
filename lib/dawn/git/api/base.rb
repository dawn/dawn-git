require "dawn/git/api/base"
require "dawn/git/api-request"

module Dawn
  module Git
    module Api
      class Base

        def self.request(options)
          Dawn::Git::Api.request options
        end

        def self.json_request(options)
          JSON.load request(options).body
        end

      end
    end
  end
end
