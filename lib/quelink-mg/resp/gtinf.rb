# frozen_string_literal: true

module QuelinkMg
  module Resp
    class Gtinf < Base
      GTINF_RESP_KEYS = %w[protocol_version unique_id device_name state iccid csq_rssi
                          csq_ber external_power_supply mileage reserved battery_voltage charging
                          led_on gps_on_need reserved reserved last_gps_fix_utc_time battery_percentage reserved
                          temperature reserved reserved send_time count_number].freeze
  
      def hash
        unify_keys(GTINF_RESP_KEYS.zip(@response.split(',')).to_h)
      end
    end
  end
end
