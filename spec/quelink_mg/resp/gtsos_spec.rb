# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Resp::Gtsos do
  it 'parses valid response' do
    response = 'D40102,015181001707687,,0,0,1,1,0.0,265,116.7,114.015807,22.537240,20230806074855,0460,0000,27BD,0DFC,,100,20230806074855,00F8$'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['report_id']).to eq 0
    expect(parsed_response['report_type']).to eq 0
    expect(parsed_response['number']).to eq 1
    expect(parsed_response['gps_accuracy']).to eq 1
    expect(parsed_response['speed']).to eq 0.0
    expect(parsed_response['azimuth']).to eq 265
    expect(parsed_response['altitude']).to eq 116.7
    expect(parsed_response['longitude']).to eq 114.015807
    expect(parsed_response['latitude']).to eq 22.53724
    expect(parsed_response['gps_utc_time']).to eq Time.use_zone('UTC') { Time.zone.parse('20230806074855') }.in_time_zone
    expect(parsed_response['mcc']).to eq 460
    expect(parsed_response['mnc']).to eq 0
    expect(parsed_response['lac']).to eq '27BD'
    expect(parsed_response['cel_id']).to eq '0DFC'
    expect(parsed_response['odo_mileage']).to eq ''
    expect(parsed_response['battery_percentage']).to eq 100
    expect(parsed_response['send_time']).to eq Time.use_zone('UTC') { Time.zone.parse('20230806074855') }.in_time_zone
    expect(parsed_response['count_number']).to eq '00F8$'
  end
end
