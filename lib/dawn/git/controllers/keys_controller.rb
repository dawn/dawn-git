require "dawn/git/controllers/base_controller"
require "dawn/git/keyring"

module Dawn
  module Git
    class KeysController < BaseController

      def all

      end

      ###
      # POST /keys
      def create
        key = params[:key]
      end

      def destroy
        key = params[:key]
      end

    end
  end
end
