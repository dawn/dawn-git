require "dawn/git/controllers/base_controller"

module Dawn
  module Git
    class ReposController < BaseController

      ###
      def all
        #
      end

      ###
      # @param [String] username
      def all_from_user
        #
      end

      ###
      # @param [String] username
      # @param [String] reponame
      def create
        #
      end

      ###
      # @param [String] username
      # @param [String] reponame
      def get_repo
        #
      end

      ###
      # @param [String] username
      # @param [String] reponame
      def update
        #
      end

      ###
      # @param [String] username
      # @param [String] reponame
      def build
        username = params[:username]
        reponame = params[:reponame]
      end

      ###
      # @param [String] username
      # @param [String] reponame
      def destroy
        #
      end

    end
  end
end
