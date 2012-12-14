require "date"
require "fileutils"
require "active_support/core_ext/string/inflections"

module MetricsSatellite
  class Collector
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
      File.expand_path("../../../../reports/#{name}", __FILE__).tap do |path|
        FileUtils.mkdir_p(path)
      end
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
      self.class.to_s.split("::").last.underscore
    end

    def ext
      self.class::EXT
    end
  end
end
