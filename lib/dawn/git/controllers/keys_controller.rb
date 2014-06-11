require "dawn/git/controllers/base_controller"
require "dawn/git/keyring"

module Dawn
  module Git
    class KeysController < BaseController

      def all
        status 200
        json keys: Keyring.keys
      end

      ###
      # POST /keys
      def create
        key = params[:key]

        if SSHKey.valid_ssh_public_key?(key)
          if Keyring.key?(key)
            status 409
            json message: "the key already exists"
          else
            fingerprint = SSHKey.fingerprint(key)
            status 200
            json key: key, fingerprint: fingerprint
          end
        else
          status 422
          json message: "sshkey was invalid, or not a public key"
        end
      end

      def destroy
        key = params[:key]

        if SSHKey.valid_ssh_public_key?(key)
          if Keyring.key?(key)
            Keyring.delete(key)
            status 200
            json message: "key has been removed"
          else
            status 409
            json message: "the key does not exist"
          end
        else
          status 422
          json message: "sshkey was invalid, or not a public key"
        end
      end

    end
  end
end
