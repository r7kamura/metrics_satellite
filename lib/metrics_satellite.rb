require "metrics_satellite/version"
require "metrics_satellite/commands/command"
require "metrics_satellite/commands/brakeman"
require "metrics_satellite/commands/flay"
require "metrics_satellite/commands/guideline"
require "metrics_satellite/commands/hotspots"
require "metrics_satellite/commands/rails_best_practices"

module MetricsSatellite
  class << self
    def collect
      Dir.chdir(app_path) { commands.map(&:run) }
    end

    private

    def reports
      Dir.glob("{#{report_directory_pattern}}/**/*").sort.reverse
    end

    def app_path
      ENV["APP_PATH"] || begin
        puts 'ENV["APP_PATH"] is required'
        exit
      end
    end

    def report_directory_pattern
      commands.map(&:underscore).join(",")
    end

    def commands
      [
        Brakeman,
        Flay,
        Guideline,
        Hotspots,
        RailsBestPractices,
      ]
    end
  end
end
