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

    def run
      create_directory
      collect
    end

    def collect
      raise "Implement #{self.class}#collect"
    end
  end
end
