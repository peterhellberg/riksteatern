# encoding: utf-8

require_relative '../spec_helper'

describe "Production" do
  subject { Riksteatern::Production }

  let(:hamster) {
    subject.new parsed_fixture('produktion/314')
  }

  describe "find" do
    it "finds a production based on id" do
      with_data([parsed_fixture('produktion/314')]) do
        l = subject.find(314)

        last_params.must_equal productionId: 314

        l.name.must_equal 'Kan man älska en hamster?'
      end
    end

    it "returns nil if passed an empty array" do
      with_data([]) do
        subject.find(123).must_be_nil
      end
    end
  end
end
