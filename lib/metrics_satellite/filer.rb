module MetricsSatellite
  module Filer
    EXT = "txt"

    private

    def filepath
      "#{directory}/#{filename}"
    end

    def directory
      File.expand_path("../../../reports/#{name}", __FILE__).tap do |path|
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
