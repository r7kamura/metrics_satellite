module MetricsSatellite
  class Runner
    def self.run
      new.run
    end

    def run
      case ARGV[0]
      when "collect"
        in_app_direcotry { run_commands }
      else
        exit
      end
    end

    private

    def run_commands
      commands.each(&:run)
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
