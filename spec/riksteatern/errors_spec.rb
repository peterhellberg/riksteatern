# encoding: utf-8

require_relative '../spec_helper'

describe "Errors" do
  it "should have an error for unauthorized users" do
    error = Riksteatern::UnauthorizedUser
    -> { raise error }.must_raise error
  end
end
