# frozen_string_literal: true

class InvalidATGTBSIException < StandardError; end
class InvalidATGTCFGException < StandardError; end
class InvalidATGTCMDException < StandardError; end
class InvalidATGTFRIException < StandardError; end
class InvalidATGTQSSException < StandardError; end
class InvalidATGTRTOException < StandardError; end
class InvalidATGTSRIException < StandardError; end
class InvalidATGTUDFException < StandardError; end

module QuelinkMg
  module At
    class Base
      def initialize(params:)
        @params = params
      end

      private

      def verify_params(acceptable_values, error)
        required_values.each do |rv|
          raise_error(rv, error) if @params.fetch(rv, nil).nil?
        end

        acceptable_values.each do |k, v|
          value = @params.fetch(k, nil)

          next if value.blank? || v.include?(value)

          raise_error(k, error)
        end
      end

      def required_values
        %i[password serial_number]
      end

      def raise_error(type, error)
        raise error, "Wrong #{type}: #{@params}"
      end

      def reserved; end
    end
  end
end
