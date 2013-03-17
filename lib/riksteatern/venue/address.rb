# encoding: utf-8

module Riksteatern
  class Venue
    class Address
      attr_reader :address1, :address2, :postal_code, :postal_city, :country_code

      def initialize(data)
        @address1     = data['address1']
        @address2     = data['address2']
        @postal_code  = data['postalCode']
        @postal_city  = data['postalCity']
        @country_code = data['countryCode']
      end

      def to_s
        [
          address1,
          address2,
          postal_code,
          postal_city,
          country_code
        ].compact.join("\n")
      end
    end
  end
end
