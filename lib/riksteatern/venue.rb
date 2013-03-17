# encoding: utf-8

require_relative 'venue/address'
require_relative 'venue/location'
require_relative 'venue/accessibility'

module Riksteatern
  class Venue
    class << self
      def find(id)
        data = get_data(venueId: id)
        new(data.first) if data.any?
      end

      def all(params = {})
        get_data(params).map { |c| new(c) }
      end

      alias :query :all

      def get_data(params = {})
        Riksteatern.api.locations(params)
      end
    end

    attr_reader :api_url, :id, :name, :type_id, :type, :number_of_seats,
                :stage_width, :stage_depth, :stage_opening, :acting_depth,
                :stage_min_height, :homepage, :phone_numbers,
                :address, :location, :accessibility

    def initialize(data)
      @data = data.tap do |d|
        i = d['venueInformation'] || {}
        v = d['venueDescription'] || {}

        @api_url          = d['venueUrl']
        @name             = d['venueName']

        @type_id          = v['venueTypeId']
        @type             = v['venueType']
        @number_of_seats  = v['numberOfSeats']
        @stage_width      = v['stageWidth']
        @stage_depth      = v['stageDepth']
        @stage_opening    = v['stageOpening']
        @acting_depth     = v['actingDepth']
        @stage_min_height = v['stageMinHeight']

        @homepage         = i['homepage']
        @phone_numbers    = i['phoneNumber']

        @address          = Address.new(i['address'])
        @location         = Location.new(i['location'])
        @accessibility    = Accessibility.new(i['accesibility'])
      end
    end
  end
end
