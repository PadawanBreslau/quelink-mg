# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Resp::Gtinf do
  it 'parses valid response' do
    response = 'D40102,0860201061504521,gl310m,42,89860117851087152093,16,99,1,0.1,,4.18,1,1,0,,,20230811034659,100,,36.7,,,20230811114700,00A0$'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['state']).to eq 42
    expect(parsed_response['iccid']).to eq 89_860_117_851_087_152_093
    expect(parsed_response['csq_rssi']).to eq 16
    expect(parsed_response['csq_ber']).to eq 99
    expect(parsed_response['external_power_supply']).to eq 1
    expect(parsed_response['mileage']).to eq 0.1
    expect(parsed_response['battery_voltage']).to eq 4.18
    expect(parsed_response['charging']).to eq 1
    expect(parsed_response['led_on']).to eq 1
    expect(parsed_response['gps_on_need']).to eq 0
    expect(parsed_response['last_gps_fix_utc_time']).to eq Time.use_zone('UTC') { Time.zone.parse('20230811034659') }.in_time_zone
    expect(parsed_response['battery_percentage']).to eq 100
    expect(parsed_response['temperature']).to eq 36.7
    expect(parsed_response['send_time']).to eq Time.use_zone('UTC') { Time.zone.parse('20230811114700') }.in_time_zone
    expect(parsed_response['count_number']).to eq '00A0$'
  end
end
