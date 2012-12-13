module MetricsSatellite
  class Brakeman < Command
    EXT = "html"

    def run
      system(
        "brakeman",
        "--output", filepath
      )
    end
  end
end
