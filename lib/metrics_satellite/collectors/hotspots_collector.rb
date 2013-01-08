module MetricsSatellite
  class HotspotsCollector < Collector
    def collect
      system(
        "hotspots",
        "--repository", repository_path,
        "--cutoff", options[:hotspots_cutoff] || "10",
        "--time", options[:hotspots_time] || "14",
        :out => file
      )
    end

    private

    def repository_path
      options[:git] || "."
    end
  end
end
