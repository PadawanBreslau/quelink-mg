# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QuelinkMg::At::Gtfri do
  it 'creates command when params are valid' do
    params =
      {
        password: 'gl310m',
        mode: 1,
        discard_no_fix: 0,
        begin_time: '0000',
        end_time: '0000',
        check_interval: 1,
        send_interval: 5,
        ignition_check_interval: 180,
        ignition_send_interval: 180,
        distance: 65_535,
        mileage: 500,
        movement_detection_mode: 0,
        movement_speed: 10,
        movement_distance: 1000,
        movement_send_number: 5,
        corner: 10,
        eri_mask: '00',
        serial_number: 'FFFF'
      }

    expect(described_class.new(params:).message).to eq 'AT+GTFRI=gl310m,1,0,,,0000,0000,1,5,180,180,,65535,' \
                                                       '500,0,10,1000,5,10,00,FFFF$'
  end

  it 'raises error on missing params' do
    expect { described_class.new(params: {}).message }.to raise_error(InvalidATGTFRIException)
  end

  it 'raises error on improper params' do
    params =
      {
        password: 'gl310m',
        mode: 1,
        discard_no_fix: 0,
        begin_time: '0000',
        end_time: '0000',
        check_interval: 1,
        send_interval: 5,
        ignition_check_interval: 180,
        ignition_send_interval: 180,
        distance: 65_535,
        mileage: 500,
        movement_detection_mode: 0,
        movement_speed: 2000,
        movement_distance: 1000,
        movement_send_number: 5,
        corner: 10,
        eri_mask: '00',
        serial_number: 'FFFF'
      }

    expect { described_class.new(params:).message }.to raise_error(InvalidATGTFRIException)
  end
end
