require "nokogiri"

module MetricsSatellite
  class BrakemanSummarizer < Summarizer
    EXT = "html"

    private

    def create
      { :count => count }
    end

    def count
      count_node.text.strip.to_i
    end

    def count_node
      count_node_parent.css("td")[1]
    end

    def count_node_parent
      tree.css("#summary + table tr").detect do |tr|
        td = tr.css("td")
        td && td.text =~ /Security Warnings/
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
