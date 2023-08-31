# frozen_string_literal: true

module QuelinkMg
    module At
      class Gtcfg < Base
        def message
          validate_values
  
          "AT+GTCFG=#{joined_params}$"
        end
  
        private
  
        GTCFG_VALID_PARAMS = %i[password new_password device_name enable_odo odo_initial_mileage gps_on_need
                                gps_fix_delay report_item_mask reserved reserved event_mask epb_mode led_on
                                info_report_enable info_report_interval location_request_mask expiry_enable
                                expiry_time agps_mode gsm_report battery_switch_power_on battery_low_percentage reserved reserved serial_number].freeze
  
        def joined_params
          GTCFG_VALID_PARAMS.map { |method| @params.fetch(method, nil) }.join(',')
        end
  
        def validate_values
          acceptable_values = {
            enable_odo: (0..1),
            odo_initial_mileage: (0.0..4294967.0),
            gps_on_need: (0..2),
            gps_fix_delay: (5..60),
            # report_item_mask: (0x0000..0x007F),
            # event_mask: (0x0000..0x3FFF),
            epb_mode: (0..1),
            led_on: (0..2),
            info_report_enable: (0..1),
            info_report_interval: (30..86400),
            location_request_mask: (0..2),
            expiry_enable: (0..1),
            agps_mode: (0..1),
            battery_switch_power_on: (0..1),
            battery_low_percentage: (0..30)
          }
  
          verify_params(acceptable_values, InvalidATGTException)
        end
      end
    end
  end
  