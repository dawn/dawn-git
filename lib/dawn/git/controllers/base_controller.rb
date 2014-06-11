module Dawn
  module Git
    class BaseController

      attr_reader :params

      def call(name, params={})
        @params = Hash[params]
        send name
      end

    end
  end
end
