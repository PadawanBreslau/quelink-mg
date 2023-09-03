# frozen_string_literal: true

module QuelinkMg
  module At
    class Gtudf < Base
      def message
        validate_values

        "AT+GTUDF=#{joined_params}$"
      end

      private

      GTUDF_VALID_PARAMS = %i[password mode group_id input_id_mask debounce_time inzizo_mask outzizo_mask
                              stocmd_id_mask stocmd_ack reserved reserved reserved reserved serial_number].freeze

      def joined_params
        GTUDF_VALID_PARAMS.map { |method| @params.fetch(method, nil) }.join(',')
      end

      def validate_values
        acceptable_values = {
          mode: (0..2),
          group_id: (0..31),
          debounce_time: (0..86_400),
          stocmd_ack: (0..1)
        }

        verify_params(acceptable_values, InvalidATGTUDFException)
      end
    end
  end
end
