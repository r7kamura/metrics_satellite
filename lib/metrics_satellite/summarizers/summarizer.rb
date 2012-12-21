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
      validate_report_existence
      create_merged_summaries
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

    def create_merged_summaries
      create.inject({}) do |hash, (key, value)|
        hash.merge([type, key].join("_").to_sym => value)
      end
    end

    def validate_report_existence
      raise ReportNotFoundError, "Report for #{tool_name} is not found" unless report_exist?
    end

    class ReportNotFoundError < StandardError; end
  end
end
