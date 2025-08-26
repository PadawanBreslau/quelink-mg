# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::Resp::Gtupd do
  it 'parses valid response' do
    response = 'D00101,352948070074301,,100,,20161105074725,11F0$'

    parsed_response = described_class.new(response:).hash
    expect(parsed_response).not_to eq({})
    expect(parsed_response['code']).to eq 100
  end
end
