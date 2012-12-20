require "date"
require "fileutils"

module MetricsSatellite
  class Collector
    include Filer

    attr_reader :options

    def self.underscore
      to_s.underscore.split("/").last
    end

    def initialize(options = {})
      @options = options
    end
  end
end
