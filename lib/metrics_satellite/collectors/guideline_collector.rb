module MetricsSatellite
  class GuidelineCollector < Collector
    def run
      system(
        "guideline",
        "--no-unused-method",
        "--no-trailing-whitespace",
        "--abc-complexity", "100",
        "--long-method", "100",
        "--long-line", "160",
        :out => file
      )
    end
  end
end
