module MetricsSatellite
  class Summarizer
    include Filer

    attr_reader :options

    def self.summarize(options = {})
      new(options).summarize
    end

    def initialize(options = {})
      @options = options
    end

    def summarize
      raise ReportNotFoundError, "Report is not found for #{self.class}" unless report_exist?
      create.inject({}) do |hash, (key, value)|
        hash.merge([type, key].join("_").to_sym => value)
      end
    end

    private

    def type
      self.class.to_s.split("::").last.sub(/Summarizer$/, "").underscore
    end

    def create
      raise "Implement #{self.class}#create"
    end

    def report_exist?
      pathname.exist?
    end

    class ReportNotFoundError < StandardError; end
  end
end
