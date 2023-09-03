# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::At::Gtudf do
  it 'creates command when params are valid' do
    params =
      {
        password: 'gl310m',
        mode: 1,
        group_id: 0,
        input_id_mask: 1_000_000_000,
        debounce_time: 0,
        inzizo_mask: 0,
        outzizo_mask: 0,
        stocmd_id_mask: 1,
        stocmd_ack: 0,
        serial_number: 'FFFF'
      }

    expect(described_class.new(params:).message).to eq 'AT+GTUDF=gl310m,1,0,1000000000,0,0,0,1,0,,,,,FFFF$'
  end

  it 'raises error on missing params' do
    expect { described_class.new(params: {}).message }.to raise_error(InvalidATGTUDFException)
  end

  it 'raises error on improper params' do
    params =
      {
        password: 'gl310m',
        mode: 1,
        group_id: 0,
        input_id_mask: 1_000_000_000,
        debounce_time: 0,
        inzizo_mask: 0,
        outzizo_mask: 0,
        stocmd_id_mask: 1,
        stocmd_ack: 6,
        serial_number: 'FFFF'
      }

    expect { described_class.new(params:).message }.to raise_error(InvalidATGTUDFException)
  end
end
