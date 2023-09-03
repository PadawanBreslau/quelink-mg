# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::At::Gtsri do
  it 'creates command when params are valid' do
    params =
      {
        password: 'gl310m',
        report_mode: 3,
        buffer_mode: 1,
        main_server_ip: '218.17.46.11',
        main_server_port: 95,
        backup_server_ip: '213.175.74.200',
        backup_server_port: 5682,
        sms_gateway: 13_824_347_475,
        heartbit_interval: 5,
        sack_enable: 1,
        sms_ack_enable: 1,
        serial_number: 'FFFF'
      }

    expect(described_class.new(params:).message).to eq 'AT+GTSRI=gl310m,3,,1,218.17.46.11,95,213.175.74.200,' \
                                                       '5682,13824347475,5,1,1,,,,FFFF$'
  end

  it 'raises error on missing params' do
    expect { described_class.new(params: {}).message }.to raise_error(InvalidATGTSRIException)
  end

  it 'raises error on improper params' do
    params =
      {
        password: 'gl310m',
        report_mode: 3,
        buffer_mode: 1,
        main_server_ip: '218.17.46.11',
        main_server_port: 95,
        backup_server_ip: '213.175.74.200',
        backup_server_port: 5682,
        sms_gateway: 13_824_347_475,
        heartbit_interval: 5,
        sack_enable: 10,
        sms_ack_enable: 8,
        serial_number: 'FFFF'
      }

    expect { described_class.new(params:).message }.to raise_error(InvalidATGTSRIException)
  end
end
