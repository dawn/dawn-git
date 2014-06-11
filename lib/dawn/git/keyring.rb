require 'sshkey'

module Dawn
  module Git
    module Keyring

      class Key

        attr_accessor :host
        attr_accessor :keytype
        attr_accessor :key

        def initialize(host, keytype, key)
          @host, @keytype, @key = host, keytype, key
        end

        def valid?
          @key && SSHKey.valid_ssh_public_key?(@key)
        end

        def to_sshkey
          SSHKey.new @key
        end

      end

      def self.parse_line(str)
        h,y,k = nil, nil, nil
        if matchdata = str.match(/(?<host>\S+)\s(?<keytype>\S+)\s(?<key>\S+)/)
          h,y,k = matchdata[:host], matchdata[:keytype], matchdata[:key]
        end
        Key.new h, y, k
      end

      def self.parse(str)
        str.each_line.map do |line|
          parse_line line
        end
      end

      def self.from_file(filename)
        File.open filename, "r" do |f|
          return parse(f.read)
        end
      end

      def self.known_hosts_filename
        File.expand_path(".ssh/known_hosts", Dir.home("git"))
      end

      def self.from_known_hosts
        from_file known_hosts_filename
      end

      def self.known_hosts
        from_known_hosts
      end

      def self.keys
        known_hosts.map { |k| k.key }
      end

      def self.key?(key)
        # check known_hosts if the key exists
        known_hosts.any? { |k| k.key == key }
      end

      def self.add(key)
        File.open known_hosts_filename, "a" do |f|
          f.puts key
        end
      end

      def self.delete(key)
        File.open known_hosts_filename, "r+" do |f|
          f.each_line do |line|
            f.puts line unless line.include?(key)
          end
        end
      end

    end
  end
end
