# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::At::Gtqss do
  it 'creates command when params are valid' do
    params =
      {
        password: 'gl310m',
        lte_apn: 'net',
        report_mode: 3,
        buffer_mode: 1,
        main_server_ip: '218.17.46.11',
        main_server_port: 91,
        backup_server_ip: '213.175.74.200',
        backup_server_port: 5682,
        sms_gateway: 13_824_347_475,
        heartbit_interval: 0,
        sack_enable: 0,
        serial_number: 'FFFF'
      }

    expect(described_class.new(params:).message).to eq 'AT+GTQSS=gl310m,net,,,3,,1,218.17.46.11,91,213.175.74.200,' \
                                                       '5682,13824347475,0,0,,,FFFF$'
  end

  it 'raises error on missing params' do
    expect { described_class.new(params: {}).message }.to raise_error(InvalidATGTQSSException)
  end

  it 'raises error on improper params' do
    params =
      {
        password: 'gl310m',
        lte_apn: 'net',
        report_mode: 3,
        buffer_mode: 1,
        main_server_ip: '218.17.46.11',
        main_server_port: 91,
        backup_server_ip: '213.175.74.200',
        backup_server_port: 5682,
        sms_gateway: 13_824_347_475,
        heartbit_interval: 400,
        sack_enable: 0,
        serial_number: 'FFFF'
      }

    expect { described_class.new(params:).message }.to raise_error(InvalidATGTQSSException)
  end
end
