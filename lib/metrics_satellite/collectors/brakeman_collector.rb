module MetricsSatellite
  class BrakemanCollector < Collector
    EXT = "html"

    def collect
      system(
        "brakeman",
        "--output", filepath
      )
    end
  end
end
