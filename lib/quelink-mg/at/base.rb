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
        acceptable_values.each do |k, v|
          next if v.include?(@params.fetch(k, nil))

          raise_error(k, error)
        end
      end

      def raise_error(type, error)
        raise error, "Wrong #{type}: #{@params}"
      end

      def reserved; end
    end
  end
end
