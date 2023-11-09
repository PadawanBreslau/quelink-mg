# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Buff::Gtfri do
  it 'parses valid response' do
    response = 'C30204,860201061504521,,0,0,1,1,0.0,0,96.2,21.012847,52.200338,20230813061232,0260,0003,E31F,0447020D,,34,20230813061231,3E94'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['send_time']).to eq Time.use_zone('UTC') { Time.zone.parse('20230813061231') }.in_time_zone
    expect(parsed_response['gps_utc_time']).to eq Time.use_zone('UTC') { Time.zone.parse('20230813061232') }.in_time_zone
    expect(parsed_response['longitude']).to eq 21.012847
    expect(parsed_response['latitude']).to eq 52.200338
    expect(parsed_response['unique_id']).to eq 860_201_061_504_521
    expect(parsed_response['battery_percentage']).to eq 34
    expect(parsed_response['device_name']).to eq ''
  end
end
