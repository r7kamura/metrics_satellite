module MetricsSatellite
  class HotspotsCollector < Collector
    def collect
      system(
        "hotspots",
        "--repository", repository_path,
        "--cutoff", "10",
        "--time", "14",
        :out => file
      )
    end

    private

    def repository_path
      options[:git] || "."
    end
  end
end
