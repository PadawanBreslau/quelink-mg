# frozen_string_literal: true

module QuelinkMg
  module Resp
    class Gtsos < Base
      GTSOS_RESP_KEYS = %w[protocol_version unique_id device_name report_id report_type number
                          gps_accuracy speed azimuth altitude longitude latitude gps_utc_time mcc mnc lac
                          cel_id odo_mileage battery_percentage send_time count_number].freeze
  
      def hash
        unify_keys(GTSOS_RESP_KEYS.zip(@response.split(',')).to_h)
      end
    end
  end
end
