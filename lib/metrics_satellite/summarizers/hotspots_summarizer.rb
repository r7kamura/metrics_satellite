module MetricsSatellite
  class HotspotsSummarizer < Summarizer
    def summarize
      super
      Summary.new(:count => pathname.readlines.size)
    end
  end
end
