require "dawn/git/api/base"

module Dawn
  module Git
    module Api
      class Repos < Base

        def self.all(options={})
          json_request(
            method: :get,
            expects: 200,
            path: "/repos",
            query: options
          )
        end

        def self.all_for_user(options={})
          username = options.delete(:username)

          json_request(
            method: :get,
            expects: 200,
            path: "/repos/#{username}",
            query: options
          )
        end

        def self.get(options)
          username = options.delete(:username)
          reponame = options.delete(:reponame)

          json_request(
            method: :get,
            expects: 200,
            path: "/repos/#{username}/#{reponame}",
            query: options
          )
        end

      end
    end
  end
end
