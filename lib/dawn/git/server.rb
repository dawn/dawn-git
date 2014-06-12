require "sinatra"
require "dawn/git/version"
require "dawn/git/controllers"

module Dawn
  module Git
    class Server < Sinatra::Base

      helpers do
        def act(controller, name)
          controller.action(name).call request, response, params
        end
      end

      ###
      # GET /version
      get '/version' do
        { version: Dawn::Git::Version::STRING }.to_json
      end

      ###
      # GET /repos
      get '/repos' do
        act ReposController, :all
      end

      ###
      # GET /repos/:username
      get '/repos/:username' do
        act ReposController, :all_from_user
      end

      ###
      # GET /repos/:username/:reponame
      #   Retrieve repo information
      get '/repos/:username/:reponame' do
        act ReposController, :get_repo
      end

      ###
      # POST /repos
      # @param [String] username
      # @param [String] reponame
      #   Creates a new repo
      post '/repos' do
        act ReposController, :create
      end

      ###
      # POST /repos
      # @param [String] username
      # @param [String] reponame
      #   Creates a new repo
      post '/repos/:username' do
        act ReposController, :create
      end

      ###
      # POST /repos/:username/:reponame
      #   Update repo
      post '/repos/:username/:reponame' do
        act ReposController, :update
      end

      ###
      # POST /repos/:username/:reponame/build
      #   Initiate build process on repo
      post '/repos/:username/:reponame/build' do
        act ReposController, :build
      end

      ###
      # DELETE /repos/:username/:reponame
      delete '/repos/:username/:reponame' do
        act ReposController, :destroy
      end

      ###
      # GET /keys
      #   Retrieve all known hosts sshkeys
      get '/keys' do
        act KeysController, :all
      end

      ###
      # POST /keys
      #   Add new sshkey to known hosts
      # @param [String] key
      post '/keys' do
        act KeysController, :create
      end

      ###
      # DELETE /keys
      #   Remove sshkey from known hosts
      # @param [String] key
      delete '/keys' do
        act KeysController, :destroy
      end

      ### TEST route, serves no other purpose than for tea...
      # GET /tea
      get '/tea' do
        act TestController, :tea
      end

    end
  end
end
