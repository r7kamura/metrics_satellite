module MetricsSatellite
  class FlaySummarizer < Summarizer
    def summarize
      super
      Summary.new(:total_score => total_score)
    end

    private

    def first_line
      pathname.each_line.to_a[0]
    end

    def total_score
      first_line[/\d+$/].to_i
    end
  end
end
