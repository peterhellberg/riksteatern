# encoding: utf-8

require_relative 'spec_helper'

describe "Riksteatern" do
  subject { Riksteatern }

  describe "configure" do
    it "can be configured" do
      subject.config.base_url.must_equal 'https://riksteatern.se:8181/api'

      subject.configure do |c|
        c.base_url = 'changed.url'
      end

      subject.config.base_url.must_equal 'changed.url'
    end

    it "can change the json parser lamda" do
      subject.configure do |c|
        c.json_parser = ->{ 'foo' }
      end

      subject.config.json_parser.call.must_equal 'foo'
    end
  end

  describe "config" do
    it "returns a (default) config object" do
      subject.config.must_be_instance_of Riksteatern::Config
    end
  end

  describe "api" do
    it "returns a (default) api object" do
      subject.api.must_be_instance_of Riksteatern::Api
    end
  end

  describe "account" do
    it "configures the username and password" do
      username = 'foo@bar.biz'
      password = 'FooBar'

      r = subject.account(username, password)

      r.config.username.must_equal username
      r.config.password.must_equal password
    end
  end
end
