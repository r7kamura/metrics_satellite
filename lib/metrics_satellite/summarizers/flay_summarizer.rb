module MetricsSatellite
  class FlaySummarizer < Summarizer
    private

    def create
      { :count => count }
    end

    def first_line
      lines[0]
    end

    def count
      first_line[/\d+$/].to_i
    end

    def lines
      pathname.readlines
    end
  end
end
