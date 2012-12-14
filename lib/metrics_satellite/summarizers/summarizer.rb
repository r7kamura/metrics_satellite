module MetricsSatellite
  # Abstract class to summarize the result of Metrics tool.
  # This class has `.summarize` method to return an instance of `Summary` class.
  class Summarizer
    include Filer

    def self.summarize
      new.summarize
    end

    def summarize
      raise "Implement `#summarize` method"
    end
  end
end
