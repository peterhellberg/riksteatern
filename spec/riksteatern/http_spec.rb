# encoding: utf-8

require_relative '../spec_helper'

describe "HTTP" do
  subject { Riksteatern::HTTP }

  let(:uri) { URI.parse('http://example.local/') }

  describe "get" do
    it "returns the response body if the response code is 200" do
      mock = MiniTest::Mock.new.expect(:code, '200').
                                expect(:code, '200').
                                expect(:body, 'foobar')

      subject.stub(:make_request, mock) do
        subject.get(uri).must_equal 'foobar'
      end

      mock.verify
    end

    it "raises an exception if the response code is 401" do
      mock = MiniTest::Mock.new.expect(:code, '401')

      subject.stub(:make_request, mock) do
        ->{ subject.get(uri) }.must_raise Riksteatern::UnauthorizedUser
      end

      mock.verify
    end

    it "returns nil otherwise" do
      mock = MiniTest::Mock.new.expect(:code, '500').expect(:code, '500')

      subject.stub(:make_request, mock) { subject.get(uri).must_be_nil }

      mock.verify
    end
  end
end
