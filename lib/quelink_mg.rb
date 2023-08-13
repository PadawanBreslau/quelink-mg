# frozen_string_literal: true

require 'pry'
require 'date'
require 'active_support'
require 'active_support/time_with_zone'
require 'active_support/core_ext/time/zones'

require File.expand_path('quelink-mg/at/base.rb', __dir__)
require File.expand_path('quelink-mg/at/gtbsi.rb', __dir__)
require File.expand_path('quelink-mg/resp/base.rb', __dir__)
require File.expand_path('quelink-mg/resp/gtfri.rb', __dir__)
require File.expand_path('quelink-mg/ack/base.rb', __dir__)
require File.expand_path('quelink-mg/ack/gtbsi.rb', __dir__)
require File.expand_path('quelink-mg/configuration.rb', __dir__)

module QuelinkMg
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
