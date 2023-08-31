# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Resp::Gtstt do
  it 'parses valid response' do
    response = 'D40102,015181001707687,gl310m,41,1,0.0,40,212.0,114.016205,22.539455,20230811055755,0460,0001,253D,AEC3,0.2,20230811135756,012E$'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['state']).to eq 41
    expect(parsed_response['gps_accuracy']).to eq 1
    expect(parsed_response['speed']).to eq 0.0
    expect(parsed_response['azimuth']).to eq 40
    expect(parsed_response['altitude']).to eq 212.0
    expect(parsed_response['last_longitude']).to eq 114.016205
    expect(parsed_response['last_latitude']).to eq 22.539455
    expect(parsed_response['gps_utc_time']).to eq Time.zone.strptime('20230811055755',
                                                                              QuelinkMg::Resp::Base::QUELINK_DATE_FORMAT)
    expect(parsed_response['mcc']).to eq 460
    expect(parsed_response['mnc']).to eq 1
    expect(parsed_response['lac']).to eq '253D'
    expect(parsed_response['cell_id']).to eq 'AEC3'
    expect(parsed_response['odo_mileage']).to eq 0.2
    expect(parsed_response['send_time']).to eq Time.zone.strptime('20230811135756',
                                                                  QuelinkMg::Resp::Base::QUELINK_DATE_FORMAT)
    expect(parsed_response['count_number']).to eq '012E$'
  end
end
