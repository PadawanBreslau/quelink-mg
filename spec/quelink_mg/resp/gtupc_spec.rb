# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Resp::Gtupc do
  it 'parses valid response' do
    response = 'D40102,015181001707687,gl310m,0,100,https://www.poltrax.live/UPC_1.ini,20230811142238,0155$'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['command_id']).to eq 0
    expect(parsed_response['result']).to eq 100
    expect(parsed_response['download_url']).to eq 'https://www.poltrax.live/UPC_1.ini'
    expect(parsed_response['send_time']).to eq Time.zone.strptime('20230811142238',
                                                                  QuelinkMg::Resp::Base::QUELINK_DATE_FORMAT)
    expect(parsed_response['count_number']).to eq '0155$'
  end
end
