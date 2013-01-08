module MetricsSatellite
  class GuidelineCollector < Collector
    def collect
      system(
        "guideline",
        "--no-unused-method",
        "--no-hard-tab-indent",
        "--no-hash-comma",
        "--no-long-method",
        "--no-trailing-whitespace",
        "--abc-complexity", options[:guideline_abc_complexity] || "15",
        "--long-line", options[:guideline_long_line] || "128",
        :out => file
      )
    end
  end
end
