module MetricsSatellite
  class RailsBestPracticesSummarizer < Summarizer
    EXT = "html"

    def summarize
      super
      Summary.new(:count => count)
    end

    private

    def count
      matched, count_text = *count_node.text.match(/(\d+)/)
      if matched
        count_text.to_i
      else
        0
      end
    end

    def count_node
      tree.css("body > h1 + p + p")[0]
    end

    def tree
      Nokogiri.HTML(content)
    end

    def content
      pathname.read
    end
  end
end
