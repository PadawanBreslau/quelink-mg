# frozen_string_literal: true

module QuelinkMg
  module Ack
    class Gtsri < Base
      GTSRI_ACK_KEYS = %w[protocol_version unique_id device_name serial_number send_time count_number].freeze
    
      def hash
        unify_keys(GTSRI_ACK_KEYS.zip(@response.split(',')).to_h)
      end
    end
  end
end
    