# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Resp::Gtupc do
  it 'parses valid response' do
    response = 'D40102,015181001707687,gl310m,0,100,https://www.example.com/UPC_1.ini,20230811142238,0155$'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['command_id']).to eq 0
    expect(parsed_response['result']).to eq 100
    expect(parsed_response['download_url']).to eq 'https://www.example.com/UPC_1.ini'
    expect(parsed_response['send_time']).to eq Time.use_zone('UTC') { Time.zone.parse('20230811142238') }.in_time_zone
    expect(parsed_response['count_number']).to eq '0155$'
  end
end
