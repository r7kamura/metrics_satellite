module MetricsSatellite
  class HotspotsSummarizer < Summarizer
    def summarize
      Summary.new(:count => pathname.readlines.size)
    end
  end
end
