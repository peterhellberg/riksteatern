# encoding: utf-8

module Riksteatern
  class Venue
    class Location
      attr_reader :region, :municipality, :latitude, :longitude

      def initialize(data)
        pos = data.fetch('geoPosition', {}).fetch('geoPositionShipping', {})

        @region       = data['regionName']
        @municipality = data['municipalityName']
        @latitude     = pos['lat']
        @longitude    = pos['lon']
      end
    end
  end
end
