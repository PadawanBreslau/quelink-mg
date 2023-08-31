# frozen_string_literal: true

module QuelinkMg
    module At
      class Gtcmd < Base
        def message
          validate_values
  
          "AT+GTCMD=#{joined_params}$"
        end
  
        private
  
        GTCMD_VALID_PARAMS = %i[password mode stored_cmd_id command_string
                                reserved reserved reserved reserved serial_number].freeze
  
        def joined_params
          GTCMD_VALID_PARAMS.map { |method| @params.fetch(method, nil) }.join(',')
        end
  
        def validate_values
          acceptable_values = {
            mode: (0..1),
            stored_cmd_id: (0..31),
          }
  
          verify_params(acceptable_values, InvalidATGTException)
        end
      end
    end
  end
  