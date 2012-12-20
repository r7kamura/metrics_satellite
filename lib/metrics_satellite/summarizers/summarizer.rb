module MetricsSatellite
  class Summarizer
    include Filer

    def self.summarize
      new.summarize
    end

    def summarize
      raise ReportNotFoundError, "Report is not found for #{self.class}" unless report_exist?
      create
    end

    private

    def create
      raise "Implement #{self.class}#create"
    end

    def report_exist?
      pathname.exist?
    end

    class ReportNotFoundError < StandardError; end
  end
end
