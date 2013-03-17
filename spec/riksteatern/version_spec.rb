# encoding: utf-8

require_relative '../spec_helper'

describe "Version" do
  subject { Riksteatern::VERSION }

  it "returns a version string" do
    subject.must_match(/^\d+\.\d+\.\d+$/)
  end
end
