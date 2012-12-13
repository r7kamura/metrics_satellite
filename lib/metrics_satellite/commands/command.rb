require "date"
require "active_support/core_ext/string/inflections"

module MetricsSatellite
  class Command
    EXT = "txt"

    def self.run
      new.run
    end

    def self.underscore
      to_s.underscore.split("/").last
    end

    private

    def filepath
      "#{directory}/#{filename}"
    end

    def directory
      File.expand_path("../../../../../#{name}", __FILE__)
    end

    def filename
      "#{date}.#{ext}"
    end

    def date
      Date.today.strftime("%Y-%m-%d")
    end

    def file
      File.open(filepath, "w")
    end

    def name
      self.class.to_s.underscore
    end

    def ext
      self.class::EXT
    end
  end
end
