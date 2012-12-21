require "date"
require "pathname"
require "active_support/core_ext/string/inflections"

module MetricsSatellite
  module Filer
    EXT = "txt"

    private

    def pathname
      Pathname.new(filepath)
    end

    def filepath
      "#{directory}/#{filename}"
    end

    def directory
      Pathname.new(reports).join(name)
    end

    def create_directory
      FileUtils.mkdir_p(directory)
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
      tool_name.underscore
    end

    def tool_name
      single_class_name.gsub(/Summarizer$|Collector$/, "")
    end

    def single_class_name
      self.class.to_s.split("::").last
    end

    def ext
      self.class::EXT
    end

    def reports
      options[:reports] || "reports"
    end
  end
end
