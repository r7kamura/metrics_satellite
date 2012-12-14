module MetricsSatellite
  class HotspotsCollector < Collector
    def run
      system(
        "hotspots",
        "--repository", "..",
        "--cutoff", "10",
        "--time", "14",
        :out => file
      )
    end
  end
end
