# frozen_string_literal: true

class InvalidATGTBSIException < StandardError; end

module At
  class Base
    def reserved; end
  end
end
