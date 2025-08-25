# frozen_string_literal: true

module QuelinkMg
  module Resp
    class Gtver < Base
      GTVER_RESP_KEYS = %w[protocol_version unique_id device_name device_type firmware_version hardware_version reserved
                           modem_hardware_version modem_software_version send_time count_number].freeze

      def hash
        unify_keys(GTVER_RESP_KEYS.zip(@response.split(',')).to_h, true)
      end
    end
  end
end
