# encoding: utf-8

require_relative '../spec_helper'

describe "Event" do
  subject { Riksteatern::Event }

  let(:under_hatten) { subject.new(under_hatten_data) }
  let(:under_hatten_data) { parsed_fixture('repertoar/992308') }

  describe "find" do
    it "finds a event based on id" do
      with_data([under_hatten_data]) do
        event = subject.find(992308)
        last_params.must_equal eventId: 992308
        event.name.must_equal 'Under hatten'
      end
    end

    it "returns nil if passed an empty array" do
      with_data([]) do
        subject.find(123).must_be_nil
      end
    end
  end

  describe "all" do
    it "returns a list of events" do
      with_data([under_hatten_data, {}]) do
        events = subject.all
        events.size.must_equal 2
        events.first.venue_name.must_equal 'Folkets Hus, Idun'
      end
    end
  end

  describe "get_data" do
    it "returns repertoires using the api" do
      Riksteatern.api.stub(:repertoires, 'foobar') do
        subject.get_data.must_equal 'foobar'
      end
    end
  end
end
