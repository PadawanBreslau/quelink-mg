# frozen_string_literal: true

module At
  class Gtbsi < Base
    def initialize(params:)
      @params = params
    end

    def message
      validate_values
      
      "AT+GTBSI=#{joined_params}$"
    end

    private

    GTBSI_VALID_PARAMS = %i[password lte_apn lte_apn_user_name ltn_apn_password gprs_apn gprs_apn_user_name
                            gprs_apn_password network_mode lte_mode apn_authentication_methods manual_netreg
                            reserved reserved reserved reserved serial_number].freeze

    def joined_params
      GTBSI_VALID_PARAMS.map { |method| @params.fetch(method, nil) }.join(',')
    end

    def validate_values
      acceptable_values = {
        network_mode: (0..3),
        lte_mode: (0..3),
        apn_authentication_methods: (0..3),
        manual_netreg: (0..5)
      }

      acceptable_values.each do |k,v|
        next if v.include?(@params.fetch(k, nil))
        raise_error(k)
      end
    end

    def raise_error(type)
      raise InvalidATGTBSIException, "Wrong #{type}: #{@params}"
    end
  end
end
