# encoding: utf-8

module Riksteatern
  class Production
    class << self
      def find(id)
        data = get_data(productionId: id)
        new(data.first) if data.any?
      end

      def all(params = {})
        get_data(params).map { |c| new(c) }
      end

      alias :query :all

      def get_data(params = {})
        Riksteatern.api.productions(params)
      end
    end

    attr_reader :data, :api_url, :id, :name, :intro_text, :description,
                :homepage, :participants, :number_of_participants,
                :performance_length_hours, :performance_length_minutes,
                :pause, :categories, :pictures,
                :first_performance_location, :first_performance_date,
                :premiere_location, :premiere_date,
                :new_premiere_location, :new_premiere_date,
                :producer

    def initialize(data)
      @data = data.tap do |d|
        i = d['productionInformation'] || {}

        @api_url                    = d['productionUrl']
        @id                         = Integer(@api_url.split('/').last)
        @name                       = i['productionName']
        @intro_text                 = i['productionIntroText']
        @description                = i['productionDescription']
        @homepage                   = i['productionHomepage']
        @participants               = i['participants']
        @number_of_participants     = i['numberOfParticipants']
        @performance_length_hours   = i['performanceLengthHrs'].to_i
        @performance_length_minutes = i['performanceLengthMns'].to_i
        @pause                      = i['pause']
        @categories                 = i['category']
        @pictures                   = i['productionPictures']
        @first_performance_location = i['firstPerformanceLocation']
        @first_performance_date     = i['firstPerformanceDate']
        @premiere_location          = i['premiereLocation']
        @premiere_date              = i['premiereDate']
        @new_premiere_location      = i['newPremiereLoction']
        @new_premiere_date          = i['newPremiereDate']

        @producer = Producer.new(d['producerInformation'])
      end
    end
  end
end
