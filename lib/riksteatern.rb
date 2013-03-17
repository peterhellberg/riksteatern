# encoding: utf-8

require 'riksteatern/api'
require 'riksteatern/config'
require 'riksteatern/errors'
require 'riksteatern/event'
require 'riksteatern/http'
require 'riksteatern/producer'
require 'riksteatern/production'
require 'riksteatern/venue'
require 'riksteatern/version'

module Riksteatern
  class << self
    def configure(&block)
      yield(config)
    end

    def config
      @config ||= Config.new
    end

    def api
      @api ||= Api.new(config)
    end

    def account(username, password)
      configure do |c|
        c.username = username
        c.password = password
      end

      self
    end
  end
end
