# frozen_string_literal: true

require 'spec_helper'

RSpec.describe At::Gtbsi do
  it 'creates command when params are valid' do
    params = 
      {
        password: 'qwerty',
        lte_apn: 'https://apn.org/',
        network_mode: 0,
        lte_mode: 0,
        apn_authentication_methods: 0,
        manual_netreg: 0,
        serial_number: 'ABFF'
      }

    expect(described_class.new(params:).message).to eq 'AT+GTBSI=qwerty,https://apn.org/,,,,,,0,0,0,0,,,,,ABFF$'
  end

  it 'raises error on missing params' do
    expect{described_class.new(params: {}).message}.to raise_error(InvalidATGTBSIException)
  end

  it 'raises error on missing params' do
    params = 
      {
        password: 'qwerty',
        lte_apn: 'https://apn.org/',
        network_mode: 10,
        lte_mode: 10,
        apn_authentication_methods: 0,
        manual_netreg: 0,
        serial_number: 'ABFF'
      }

    expect{described_class.new(params:).message}.to raise_error(InvalidATGTBSIException)
  end
end
