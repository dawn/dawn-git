module Dawn
  module Git
    class Server < Sinatra::Base

      ###
      # GET /repos
      get '/repos' do
        #
      end

      ###
      # POST /repos
      # @param [String] username
      # @param [String] reponame
      #   Creates a new repo
      post '/repos' do
        #
      end

      ###
      # GET /repos/:username/:reponame
      #   Retrieve repo information
      get '/repos/:username/:reponame' do
        #
      end

      ###
      # POST /repos/:username/:reponame
      post '/repos/:username/:reponame' do
        #
      end

      ###
      # POST /repos/:username/:reponame/build
      post '/repos/:username/:reponame/build' do
        #
      end

      ###
      # DELETE /repos/:username/:reponame
      delete '/repos/:username/:reponame' do
        #
      end

      ###
      # GET /keys
      get '/keys' do
        #
      end

      ###
      # POST /keys
      post '/keys' do
        #
      end

      ###
      # DELETE /keys/:id
      delete '/keys/:id' do
        #
      end

    end
  end
end
