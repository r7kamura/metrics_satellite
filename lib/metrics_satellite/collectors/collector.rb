require "date"
require "fileutils"
require "active_support/core_ext/string/inflections"

module MetricsSatellite
  class Collector
    include Filer

    def self.run
      new.run
    end

    def self.underscore
      to_s.underscore.split("/").last
    end
  end
end
