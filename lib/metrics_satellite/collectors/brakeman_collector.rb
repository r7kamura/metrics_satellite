module MetricsSatellite
  class BrakemanCollector < Collector
    EXT = "html"

    def run
      system(
        "brakeman",
        "--output", filepath
      )
    end
  end
end
