# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::At::Gtcmd do
  it 'creates command when params are valid' do
    params =
      {
        password: 'gl310m',
        mode: 1,
        stored_cmd_id: 0,
        command_string: 'AT+CFUN=4',
        serial_number: 'FFFF'
      }

    expect(described_class.new(params:).message).to eq 'AT+GTCMD=gl310m,1,0,AT+CFUN=4,,,,,FFFF$'
  end

  it 'raises error on missing params' do
    expect { described_class.new(params: {}).message }.to raise_error(InvalidATGTException)
  end

  it 'raises error on improper params' do
    params =
      {
        password: 'gl310m',
        mode: 10,
        stored_cmd_id: 0,
        command_string: 'AT+CFUN=4',
        serial_number: 'FFFF'
      }

    expect { described_class.new(params:).message }.to raise_error(InvalidATGTException)
  end
end
