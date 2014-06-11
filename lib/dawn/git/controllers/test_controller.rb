require "dawn/git/controllers/base_controller"

module Dawn
  module Git
    class TestController < BaseController

      def tea
        json message: "Tea Time!"
      end

    end
  end
end
