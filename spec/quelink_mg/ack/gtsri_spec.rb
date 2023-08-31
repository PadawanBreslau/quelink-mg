# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Ack::Gtsri do
  it 'parses valid response' do
    response = 'D40102,868239051011356,,0040,20210816045509,004F'
    parsed_response = described_class.new(response:).hash
    expect(parsed_response['protocol_version']).to eq 'D40102'
    expect(parsed_response['unique_id']).to eq 868_239_051_011_356
    expect(parsed_response['send_time']).to eq Time.zone.strptime('20210816045509',
                                                                  QuelinkMg::Resp::Base::QUELINK_DATE_FORMAT)
  end
end
