require "nokogiri"

module MetricsSatellite
  class BrakemanSummarizer < Summarizer
    EXT = "html"

    def summarize
      Summary.new(:count => count)
    end

    private

    def count
      count_node.text.strip.to_i
    end

    def count_node
      count_node_parent.css("td")[1]
    end

    def count_node_parent
      tree.css("#summary + table > tbody > tr").detect do |tr|
        tr.css("td")[0].text =~ /Security Warnings/
      end
    end

    def tree
      Nokogiri.HTML(content)
    end

    def content
      pathname.read
    end
  end
end
