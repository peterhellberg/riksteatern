# encoding: utf-8

module Riksteatern
  class Venue
    class Accessibility
      attr_reader :wheelchair_seats_in_salon, :wheelchair_seats_placement,
                  :rwc_audience, :rwc_participants, :disabled_parking,
                  :entrance_foyer_accessibility_adapted, :comments,
                  :hearing_loop_in_salon, :hearing_loop_control_date,
                  :hearing_loop_on_stage,
                  :accessibility_to_stage_for_wheelchair


      def initialize(data)
        @wheelchair_seats_in_salon             = data['wheelchairSeatsInSalon']
        @wheelchair_seats_placement            = data['wheelchairSeatsPlacement']

        @rwc_audience                          = data['rwcAudience']
        @rwc_participants                      = data['rwcParticipants']

        @hearing_loop_in_salon                 = data['hearingLoopInSalon']
        @hearing_loop_control_date             = data['hearingLoopControlDate']
        @hearing_loop_on_stage                 = data['hearingLoopOnStage']

        @disabled_parking                      = data['disabledParking']
        @entrance_foyer_accessibility_adapted  = data['entranceFoyerAccesibilityAdapted']
        @accessibility_to_stage_for_wheelchair = data['accessibilityToStageForWheelchair']

        @comments                              = data['commentsAccessibility']
      end
    end
  end
end
