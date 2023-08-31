# frozen_string_literal: true

module QuelinkMg
    module At
      class Gtfri < Base
        def message
          validate_values
  
          "AT+GTFRI=#{joined_params}$"
        end
  
        private
  
        GTFRI_VALID_PARAMS = %i[password mode discard_no_fix reserved reserved begin_time end_time
                                check_interval send_interval ignition_check_interval ignition_send_interval
                                reserved distance mileage movement_detection_mode movement_speed movement_distance
                                movement_send_number corner eri_mask serial_number].freeze
  
        def joined_params
          GTFRI_VALID_PARAMS.map { |method| @params.fetch(method, nil) }.join(',')
        end
  
        def validate_values
          acceptable_values = {
            mode: (0..5),
            discard_no_fix: (0..1),
            begin_time: '%H%M',
            end_time: '%H%M',
            check_interval: (1..86400),
            send_interval: (5..86400),
            ignition_check_interval: (5..86400),
            ignition_send_interval: (5..86400),
            distance: (50..65535),
            mileage: (50..65535),
            movement_detection_mode: (0..1),
            movement_speed: (1..999),
            movement_distance: (1..9999),
            ovement_send_number: (1..5),
            corner: (0..180),
            # eri_mask: (0x00000000...0xFFFFFFFF)
          }
  
          verify_params(acceptable_values, InvalidATGTException)
        end
      end
    end
  end
  