# frozen_string_literal: true

module QuelinkMg
  module Resp
    class Gtgsv < Base
      GTGSV_RESP_KEYS_PREFIX = %w[protocol_version unique_id device_name sv_count].freeze
      GTGSV_RESP_KEYS_SUFFIX = %w[send_time count_number].freeze
  
      def hash
        all_params = @response.split(',')

        sv_out = all_params[3].to_i

        sv_arr = []
        sv_out.times do |i|
          sv_arr << "sv_id_#{i}"
          sv_arr << "sv_power_#{i}"
        end

        keys = GTGSV_RESP_KEYS_PREFIX + sv_arr + GTGSV_RESP_KEYS_SUFFIX

        unify_keys(keys.zip(all_params).to_h)
      end
    end
  end
end
