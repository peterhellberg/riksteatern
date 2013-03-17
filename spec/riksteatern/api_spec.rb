# encoding: utf-8

require_relative '../spec_helper'

describe "Api" do
  subject { Riksteatern::Api.new(config) }

  let(:config) {
    Riksteatern::Config.new.tap do |c|
      c.base_url    = base_url
      c.http_client = BounceURI

      c.username = 'foo'
      c.password = 'bar'
    end
  }

  let(:base_url) { 'https://api.test:1234/api' }

  describe "get" do
    it "should raise an exception if the username is blank" do
      config.username = nil

      -> { Riksteatern::Api.new(config).get('foo') }.
        must_raise Riksteatern::UnauthorizedUser
    end
  end

  describe "get_json" do
    it "returns parsed JSON" do
      expected_venue_name = 'Finlandsinstitutet, Sibeliussalen'

      subject.stub(:http_get, fixture('lokal/0180126')) do
        subject.get_json(:lokal)['venueName'].must_equal expected_venue_name
      end
    end

    it "loads a blank JSON document if the GET request returns nil" do
      subject.stub(:get, nil) do
        subject.get_json(:unknown).must_equal({})
      end
    end
  end
end
