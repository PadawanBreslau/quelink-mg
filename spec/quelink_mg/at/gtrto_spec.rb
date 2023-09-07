# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::At::Gtrto do
  it 'creates command when params are valid' do
    params =
      {
        password: 'gl310m',
        sub_command: 0,
        serial_number: 'FFFF'
      }

    expect(described_class.new(params:).message).to eq 'AT+GTRTO=gl310m,0,,,,,,FFFF$'
  end

  it 'raises error on missing params' do
    expect { described_class.new(params: {}).message }.to raise_error(InvalidATGTRTOException)
  end

  it 'raises error on improper params' do
    params =
      {
        password: 'gl310m',
        sub_command: 0xFF,
        serial_number: 'FFFF'

      }

    expect { described_class.new(params:).message }.to raise_error(InvalidATGTRTOException)
  end
end
