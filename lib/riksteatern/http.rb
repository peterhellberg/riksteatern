# encoding: utf-8

require 'net/http'

module Riksteatern
  class HTTP
    class << self
      def get(uri)
        response = make_request(uri)

        if response.code == '401'
          raise UnauthorizedUser, "Wrong username/password"
        elsif response.code == '200'
          response.body
        else
          nil
        end
      end

      private

      def setup_http(uri, &block)
        Net::HTTP.start(uri.host, uri.port, {
          use_ssl: uri.scheme == 'https'
        }) do |http|
          http.read_timeout = 60
          http.verify_mode  = OpenSSL::SSL::VERIFY_NONE

          yield(http)
        end
      end

      def make_request(uri)
        setup_http(uri) do |http|
          response = http.request(prepared_request(uri))

          http.finish

          response
        end
      end

      def prepared_request(uri)
        Net::HTTP::Get.new(uri.request_uri).tap do |r|
          r.basic_auth URI.decode(uri.user), URI.decode(uri.password)
        end
      end
    end
  end
end
