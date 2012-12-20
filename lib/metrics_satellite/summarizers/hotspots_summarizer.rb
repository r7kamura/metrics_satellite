module MetricsSatellite
  class HotspotsSummarizer < Summarizer
    private

    def create
      { :count => pathname.readlines.count }
    end
  end
end
