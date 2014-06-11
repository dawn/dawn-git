require "dawn/git/version"
require "sinatra"
require "sshkey"
require "json"

module Dawn
  module Git
    class Server < Sinatra::Base

      ###
      # GET /version
      get '/version' do
        { version: Dawn::Git::Version::STRING }.to_json
      end

      ###
      # GET /repos
      get '/repos' do
        controller = ReposController.new

        controller.call :all
      end

      ###
      # GET /repos/:username
      get '/repos/:username' do
        controller = ReposController.new

        username = params[:username]

        controller.call :all_from_user, username: username
      end

      ###
      # POST /repos
      # @param [String] username
      # @param [String] reponame
      #   Creates a new repo
      post '/repos' do
        controller = ReposController.new

        username = params[:username]
        reponame = params[:reponame]

        controller.call :create, username: username, reponame: reponame

        response.body = {

        }.to_json
      end

      ###
      # POST /repos
      # @param [String] username
      # @param [String] reponame
      #   Creates a new repo
      post '/repos/:username' do
        controller = ReposController.new

        username = params[:username]
        reponame = params[:reponame]

        controller.call :create, username: username, reponame: reponame

        response.body = {

        }.to_json
      end

      ###
      # GET /repos/:username/:reponame
      #   Retrieve repo information
      get '/repos/:username/:reponame' do
        controller = ReposController.new

        username = params[:username]
        reponame = params[:reponame]

        controller.call :get_repo, username: username, reponame: reponame

        {
          exists: Dir.exists?(Dawn::Git)
        }.to_json
      end

      ###
      # POST /repos/:username/:reponame
      #   Update repo
      post '/repos/:username/:reponame' do
        controller = ReposController.new

        username = params[:username]
        reponame = params[:reponame]

        controller.call :update, username: username, reponame: reponame
      end

      ###
      # POST /repos/:username/:reponame/build
      #
      post '/repos/:username/:reponame/build' do
        controller = ReposController.new

        username = params[:username]
        reponame = params[:reponame]

        controller.call :build, username: username, reponame: reponame
      end

      ###
      # DELETE /repos/:username/:reponame
      delete '/repos/:username/:reponame' do
        controller = ReposController.new

        username = params[:username]
        reponame = params[:reponame]

        controller.call :destroy, username: username, reponame: reponame
      end

      ###
      # GET /keys
      get '/keys' do
        controller = KeysController.new

        controller.call :all
      end

      ###
      # POST /keys
      # @param [String] key
      post '/keys' do
        controller = KeysController.new

        key = params[:key]

        controller.call :create, key: key

        response.body = {

        }.to_json
      end

      ###
      # DELETE /keys/:id
      #   Remove key
      delete '/keys/:id' do
        controller = KeysController.new

        id = params[:id]

        controller.call :destroy, id: id
      end

    end
  end
end
