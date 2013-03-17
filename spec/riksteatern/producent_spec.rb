# encoding: utf-8

require_relative '../spec_helper'

describe "Producer" do
  subject { Riksteatern::Producer }

  let(:example_data) {
    {
      'producerId'       => 123,
      'producerName'     => 'foo',
      'mainContactId'    => 456,
      'producerHomepage' => 'http://producer.url/',
      'producerLogotype' => 'http://producer.url/logotype.png'
    }
  }

  it "has the attributes id, name, main_contact_id, homepage and logotype" do
    subject.new(example_data).tap do |p|
      p.id.must_equal example_data['producerId']
      p.name.must_equal example_data['producerName']
      p.main_contact_id.must_equal example_data['mainContactId']
      p.homepage.must_equal example_data['producerHomepage']
      p.logotype.must_equal example_data['producerLogotype']
    end
  end
end
