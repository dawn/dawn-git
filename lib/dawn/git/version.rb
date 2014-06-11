module Dawn
  module Git
    module Version
      MAJOR = 0
      MINOR = 1
      PATCH = 0
      BUILD = nil
      STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join(".").freeze
    end
    # backward compatibility
    VERSION = Version::STRING
  end
end
