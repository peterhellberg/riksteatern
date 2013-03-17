# encoding: utf-8

require_relative '../spec_helper'

describe "Venue" do
  subject { Riksteatern::Venue }

  let(:folkets_hus)      { subject.new(folkets_hus_data) }
  let(:folkets_hus_data) { parsed_fixture('lokal/5015846') }
  let(:finlandsinstitutet_data) { parsed_fixture('lokal/0180126') }

  describe "find" do
    it "finds a production based on id" do
      with_data([folkets_hus_data]) do
        l = subject.find(123)

        last_params.must_equal venueId: 123

        l.name.must_equal 'Folkets Hus, Idun'
      end
    end

    it "returns nil if no venue was found" do
      with_data([]) { subject.find(123).must_be_nil }
    end
  end

  describe "all" do
    it "returns an array of venues" do
      with_data([folkets_hus_data, finlandsinstitutet_data]) do
        venues = subject.all

        venues.size.must_equal 2
        venues.first.name.must_equal 'Folkets Hus, Idun'
        venues.last.name.must_equal 'Finlandsinstitutet, Sibeliussalen'
      end
    end
  end
end
