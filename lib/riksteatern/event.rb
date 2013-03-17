# encoding: utf-8

module Riksteatern
  class Event
    class << self
      def find(id)
        data = get_data(eventId: id)
        new(data.first) if data.any?
      end

      def all(params = {})
        get_data(params).map { |c| new(c) }
      end

      alias :query :all

      def get_data(params = {})
        Riksteatern.api.repertoires(params)
      end
    end

    attr_reader :data, :api_url, :id, :arranger_id, :arranger_name,
                :name, :meta_description, :information_link, :venue_api_url,
                :venue_name, :region_name, :municipality_name, :date, :time,
                :ticket_information, :ticket_information_scenpass,
                :ticket_information_online, :scenpass_benefit,
                :public_show, :co_producer, :cancelled

    def initialize(data)
      @data = data.tap do |d|
        i = d['eventInformation'] || {}

        @api_url       = d['eventUrl']
        @id            = @api_url.to_s.split('/').last.to_i
        @arranger_id   = d['arrangerId'].to_i
        @arranger_name = d['arrangerName']

        @name                        = i['eventName']
        @meta_description            = i['eventMetaDescription']
        @information_link            = i['informationLink']
        @venue_api_url               = i['venueUrl']
        @venue_name                  = i['venueName']
        @region_name                 = i['regionName']
        @municipality_name           = i['municipalityName']
        @date                        = i['eventDate']
        @time                        = i['eventTime']
        @ticket_information          = i['ticketInformation']
        @ticket_information_scenpass = i['ticketInformationScenpass']
        @ticket_information_online   = i['ticketInformationOnline']
        @scenpass_benefit            = i['scenpassBenefit']
        @public_show                 = i['publicShow']
        @co_producer                 = i['coProducer']
        @cancelled                   = i['cancelledEvent']
      end
    end
  end
end
