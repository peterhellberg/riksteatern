# encoding: utf-8

module Riksteatern
  class Producer
    attr_reader :id, :name, :main_contact_id, :homepage, :logotype

    def initialize(data)
      @id              = data['producerId']
      @name            = data['producerName']
      @main_contact_id = data['mainContactId']
      @homepage        = data['producerHomepage']
      @logotype        = data['producerLogotype']
    end
  end
end
