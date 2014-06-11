require "dawn/git/controllers/base"

module Dawn
  module Git
    class KeysController < BaseController

      def create
        key = params[:key]
      end

      def delete
        key = params[:key]
      end

    end
  end
end
