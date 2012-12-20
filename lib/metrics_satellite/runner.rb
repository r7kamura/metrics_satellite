module MetricsSatellite
  class Runner
    attr_reader :options

    def self.run
      new.run
    end

    def initialize(argv = ARGV)
      @options = OptionParser.parse!(argv)
    end

    def run
      case type
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
      in_app_direcotry do
        collectors.each do |klass|
          klass.new(options).run
        end
      end
    end

    def post_reports
      reporter.report(summaries)
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

    def summarizers
      [
        BrakemanSummarizer,
        FlaySummarizer,
        GuidelineSummarizer,
        HotspotsSummarizer,
        RailsBestPracticesSummarizer,
      ]
    end

    def in_app_direcotry
      Dir.chdir(app_path) { yield }
    end

    def app_path
      options[:app] || "."
    end

    def exit
      puts OptionParser.help
      super
    end

    def summaries
      summarizers.map(&:summarize).inject({}, &:merge)
    end

    def reporter
      Reporter.new(host, service, section)
    end

    def type
      options[:type] || exit
    end

    def host
      options[:host] || exit
    end

    def service
      options[:service] || "development"
    end

    def section
      options[:section] || "metrics"
    end
  end
end
