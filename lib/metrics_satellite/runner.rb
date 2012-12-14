module MetricsSatellite
  class Runner
    def self.run
      new.run
    end

    def run(argv = ARGV)
      case argv[0]
      when "collect"
        collect_reports
      when "post"
        post_reports
      else
        exit
      end
    end

    private

    def collect_reports
      in_app_direcotry { collectors.each(&:run) }
    end

    def collectors
      [
        BrakemanCollector,
        FlayCollector,
        GuidelineCollector,
        HotspotsCollector,
        RailsBestPracticesCollector,
      ]
    end

    def in_app_direcotry
      Dir.chdir(app_path) { yield }
    end

    def app_path
      options[:app] || "."
    end

    def options
      @options ||= OptionParser.parse!
    end

    def exit
      puts OptionParser.help
      super
    end
  end
end
