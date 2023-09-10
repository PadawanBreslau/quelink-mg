# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Resp::Gtgsv do
  it 'parses valid response' do
    response = 'F50701,860201061504521,,11,2,11,3,10,4,0,5,22,6,30,9,14,12,34,17,35,19,30,23,20,28,13,20230806094936,3E2C$'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['sv_count']).to eq 11
    expect(parsed_response['sv_id_3']).to eq 5
    expect(parsed_response['sv_power_3']).to eq 22
    expect(parsed_response['send_time']).to eq Time.use_zone('UTC') { Time.zone.parse('20230806094936') }.in_time_zone
    expect(parsed_response['count_number']).to eq '3E2C$'
  end
end
