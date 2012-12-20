module MetricsSatellite
  class GuidelineSummarizer < Summarizer
    private

    def create
      summarized_lines.inject({}) do |hash, line|
        matched, name, count = *line.match(/(.+)Checker: (\d+)/)
        if matched
          hash.merge(name.underscore.to_sym => count.to_i)
        else
          hash
        end
      end
    end

    def summarized_lines
      lines.reverse.take_while {|line| !line[/^$/] }.reverse
    end

    def lines
      pathname.readlines
    end
  end
end
