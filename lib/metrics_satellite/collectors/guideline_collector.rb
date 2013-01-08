module MetricsSatellite
  class GuidelineCollector < Collector
    def collect
      system(
        "guideline",
        "--no-unused-method",
        "--abc-complexity", options[:guideline_abc_complexity] || "15",
        "--long-method", options[:guideline_long_method] || "30",
        "--long-line", options[:guideline_long_line] || "128",
        :out => file
      )
    end
  end
end
