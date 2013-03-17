# encoding: utf-8

require 'uri'
require 'json'

module Riksteatern
  class Api
    attr_accessor :config

    def initialize(config)
      @config = config

      if @config.username.nil? || @config.password.nil?
        raise UnauthorizedUser, "Blank username/password"
      end
    end

    def locations(params = {})
      get_array(:lokal, 'locations', params)
    end

    def productions(params = {})
      get_array(:produktion, 'productions', params)
    end

    def repertoires(params = {})
      get_array(:repertoar, 'repertoires', params)
    end

    def get_array(endpoint, field_name, params)
      get_json(endpoint, params)[field_name] || []
    end

    def get(path, params = {})
      http_get prepared_uri(path, params)
    end

    def get_json(endpoint, params = {})
      load_json get("#{endpoint}.json", params) || "{}"
    end

    private

    def http_get(uri)
      uri.userinfo = URI.escape "#{@config.username}:#{@config.password}", '@'

      @config.http_client.get(uri)
    end

    def load_json(doc)
      @config.json_parser.call(doc)
    end

    def prepared_uri(endpoint, params = {})
      endpoint_uri(endpoint).tap do |uri|
        uri.query = URI.encode_www_form(params)
      end
    end

    def endpoint_uri(endpoint)
      URI.parse("#{@config.base_url}/#{endpoint}")
    end
  end
end
