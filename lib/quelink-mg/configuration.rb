# frozen_string_literal: true

module QuelinkMg
  class Configuration
    attr_accessor :time_zone

    DEFAULT_ZONE = ActiveSupport::TimeZone.new('Europe/Warsaw')
    def initialize
      @time_zone = DEFAULT_ZONE
      Time.zone = @time_zone
    end
  end
end
