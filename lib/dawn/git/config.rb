require "ostruct"

module Dawn
  module Git
    class << self
      attr_accessor :config
    end
    @config = OpenStruct.new
    @config.port = 4567
    @config.repo_user = "git"
  end
end
