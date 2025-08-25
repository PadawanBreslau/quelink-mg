# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Resp::Gtver do
  it 'parses valid response' do
    response = 'C30303,860201065688841,,GL320M_B7K1,0C09,0108,,BG95-M5,BG95M5LAR02A03,20250824185409,0006$'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['device_type']).to eq 'GL320M_B7K1'
    expect(parsed_response['firmware_version']).to eq '0C09'
    expect(parsed_response['hardware_version']).to eq '0108'
  end
end
