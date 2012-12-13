module MetricsSatellite
  class RailsBestPractices < Command
    EXT = "html"

    def run
      system(
        "rails_best_practices",
        "--format", "html",
        "--output-file", filepath
      )
    end
  end
end
