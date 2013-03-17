# encoding: utf-8

module Riksteatern
  class Config
    attr_accessor :base_url, :username, :password,
                  :json_parser, :http_client, :debug

    def initialize
      @base_url    = 'https://riksteatern.se:8181/api'
      @username    = nil
      @password    = nil
      @json_parser = ->(d) { JSON.parse(d) }
      @http_client = Riksteatern::HTTP
      @debug       = false

      yield self if block_given?
    end
  end
end
