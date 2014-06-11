module Dawn
  module Git
    module Api

      ###
      # @param [Hash] options
      ###
      def self.request(options)
        @connection ||= Excon.new
        @connection.request options
      end

    end
  end
end
