module MetricsSatellite
  # Abstract class to summarize the result of Metrics tool.
  # This class has `.summarize` method to return an instance of `Summary` class.
  class Summarizer
    include Filer

    def self.summarize
      new.summarize
    end

    def summarize
      raise ReportNotFoundError, "Report is not found for #{self.class}" unless report_exist?
    end

    private

    def report_exist?
      pathname.exist?
    end

    class ReportNotFoundError < StandardError; end
  end
end