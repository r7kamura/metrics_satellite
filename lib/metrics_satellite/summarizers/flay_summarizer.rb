module MetricsSatellite
  class FlaySummarizer < Summarizer
    def summarize
      super
      Summary.new(:total_score => total_score)
    end

    private

    def first_line
      lines[0]
    end

    def total_score
      first_line[/\d+$/].to_i
    end

    def lines
      pathname.each_line.to_a
    end
  end
end
