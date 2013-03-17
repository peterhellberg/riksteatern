# encoding: utf-8

require_relative '../spec_helper'

describe "Config" do
  subject {
    Riksteatern::Config.new do |c|
      c.base_url = base_url
      c.username = 'foo@site.com'
      c.password = 'bar'
    end
  }

  let(:base_url) { 'https://base.url/api' }

  it "returns the base_url" do
    subject.base_url.must_equal base_url
  end

  describe "json_parser" do
    it "is a lambda by default" do
      subject.json_parser.
        call('{"foo":123}')['foo'].must_equal 123
    end

    it "can be changed" do
      subject.json_parser = "foo"
      subject.json_parser.must_equal "foo"
    end
  end

  describe "http_client" do
    it "is Net::HTTP by default" do
      subject.http_client.must_equal Riksteatern::HTTP
    end

    it "can be changed" do
      subject.http_client = "bar"
      subject.http_client.must_equal "bar"
    end
  end
end
