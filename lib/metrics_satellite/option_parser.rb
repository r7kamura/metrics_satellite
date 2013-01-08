require "optparse"

module MetricsSatellite
  class OptionParser < ::OptionParser
    OPTIONS = [
      "--type=",                     "(default:       -) 'collect' or 'post'",
      "--host=",                     "(default:       -) GrowthForecast host to send report",
      "--service=",                  "(default: metrics) GrowthForecast service name",
      "--section=",                  "(default: section) GrowthForecast section name",
      "--git=",                      "(default:      ./) git repository directory",
      "--app=",                      "(default:      ./) application directory",
      "--reports=",                  "(default: reports) collected reports directory",
      "--guideline-abc-complexity=", "(default:      15) threshold of ABC complexity",
      "--guideline-long-line=",      "(default:      80) threshold of long line",
      "--guideline-long-method=",    "(default:      10) threshold of long method",
      "--hotspots-cutoff=",          "(default:      10) threshold of change count",
      "--hotspots-time=",            "(default:      14) time span of git log target",
      "--no-brakeman",               "(default:   false) disable Brakeman",
      "--no-flay",                   "(default:   false) disable Flay",
      "--no-guideline",              "(default:   false) disable Guideline",
      "--no-hotspots",               "(default:   false) disable Hotspots",
      "--no-rails-best-practices",   "(default:   false) disable RailsBestPractices",
    ]

    def self.parse!(argv)
      new.parse!(argv)
    end

    def self.help
      new.help
    end

    def initialize(*)
      super
      configure_options
    end

    def parse!(*)
      super
      options
    end

    def options
      @options ||= {}
    end

    private

    def configure_options
      arguments.each do |argument|
        on(argument.key, argument.description) do |value|
          options[argument.to_sym] = value
        end
      end
    end

    def arguments
      OPTIONS.each_slice(2).map do |key, description|
        Argument.new(key, description)
      end
    end

    class Argument
      attr_reader :key, :description

      def initialize(key, description)
        @key         = key
        @description = description
      end

      def to_sym
        str = @key
        str = without_head_hyphen(str)
        str = without_head_no(str)
        str = without_last_equal(str)
        str = underscored(str)
        str.to_sym
      end

      private

      def underscored(str)
        str.gsub("-", "_")
      end

      def without_head_hyphen(str)
        str.gsub(/^--/, "")
      end

      def without_head_no(str)
        str.gsub(/^no-/, "")
      end

      def without_last_equal(str)
        str.gsub(/=$/, "")
      end
    end
  end
end
