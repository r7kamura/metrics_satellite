module MetricsSatellite
  class GuidelineCollector < Collector
    def collect
      system(
        "guideline",
        "--no-unused-method",
        "--abc-complexity", "15",
        "--long-method", "30",
        "--long-line", "128",
        :out => file
      )
    end
  end
end
