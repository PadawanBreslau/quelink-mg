# frozen_string_literal: true

require 'spec_helper'
require 'quelink-mg/at/gtcfg'

RSpec.describe QuelinkMg::At::Gtcfg do
  it 'creates command when params are valid' do
    params =
      {
        password: 'gl310m',
        new_password: 'gl310m',
        device_name: 'gl310m',
        enable_odo: 0,
        odo_initial_mileage: 0.0,
        gps_on_need: 1,
        gps_fix_delay: 5,
        report_item_mask: '001F',
        event_mask: '0FFF',
        epb_mode: 0,
        led_on: 1,
        info_report_enable: 1,
        info_report_interval: 300,
        location_request_mask: 2,
        expiry_enable: 0,
        expiry_time: 20_491_231_235_959,
        agps_mode: 0,
        gsm_report: '0000',
        battery_switch_power_on: 0,
        battery_low_percentage: 10,
        serial_number: 'FFFF'
      }

    expect(described_class.new(params:).message).to eq 'AT+GTCFG=gl310m,gl310m,gl310m,0,0.0,1,5,001F,,,0FFF,0,1,1,' \
                                                       '300,2,0,20491231235959,0,0000,0,10,,,FFFF$'
  end

  it 'creates message if some params available' do
    params =
      {
        password: 'gl310m',
        gps_on_need: 1,
        serial_number: 'FFFF'
      }
    expect(described_class.new(params:).message).to eq 'AT+GTCFG=gl310m,,,,,1,,,,,,,,,,,,,,,,,,,FFFF$'
  end

  it 'raises error on missing params' do
    expect { described_class.new(params: {}).message }.to raise_error(InvalidATGTCFGException)
  end

  it 'raises error on improper params' do
    params =
      {
        password: 'gl310m',
        new_password: 'gl310m',
        device_name: 'gl310m',
        enable_odo: 0,
        odo_initial_mileage: 0.0,
        gps_on_need: 1,
        gps_fix_delay: 5,
        report_item_mask: '001F',
        event_mask: '0FFF',
        epb_mode: 0,
        led_on: 3,
        info_report_enable: 1,
        info_report_interval: 300,
        location_request_mask: 2,
        expiry_enable: 0,
        expiry_time: 20_491_231_235_959,
        agps_mode: 0,
        gsm_report: '0000',
        battery_switch_power_on: 0,
        battery_low_percentage: 10,
        serial_number: 'FFFF'
      }

    expect { described_class.new(params:).message }.to raise_error(InvalidATGTCFGException)
  end
end
