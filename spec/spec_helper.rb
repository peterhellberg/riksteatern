# encoding: utf-8

require 'minitest/spec'
require 'minitest/pride'
require 'minitest/autorun'

require_relative '../lib/riksteatern'

class BounceURI
  def self.get(uri)
    uri
  end
end

Riksteatern.configure do |c|
  c.http_client = BounceURI

  c.username = 'foo'
  c.password = 'bar'
end


$loaded_fixtures = {}

def fixture(name)
  $loaded_fixtures[name] ||= IO.read("spec/fixtures/#{name}.json")
end

def parsed_fixture(name)
  JSON.parse fixture(name)
end

def with_fixture(name, &block)
  Riksteatern.api.stub(:get_json, parsed_fixture(name), &block)
end

def with_data(data, &block)
  @last_params = nil
  subject.stub :get_data, ->(params){ @last_params = params; data }, &block
end

def last_params
  @last_params
end
