# frozen_string_literal: true

module QuelinkMg
    module At
      class Gtrto < Base
        def message
          validate_values
  
          "AT+GTRTO=#{joined_params}$"
        end
  
        private
  
        GTRTO_VALID_PARAMS = %i[password sub_command single_command_configuration reserved
                                reserved reserved sub_command_parameter serial_number].freeze
  
        def joined_params
          GTRTO_VALID_PARAMS.map { |method| @params.fetch(method, nil) }.join(',')
        end
  
        def validate_values
          acceptable_values = {
            # sub_command: (0x0..0xF).to_a + [0x14, 0x1C],
            # single_command_configuration: (0x0000000000000000..0xFFFFFFFFFFFFFFFF)
          }
  
          verify_params(acceptable_values, InvalidATGTException)
        end
      end
    end
  end
  