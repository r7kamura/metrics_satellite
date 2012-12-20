require "optparse"

module MetricsSatellite
  class OptionParser < ::OptionParser
    OPTIONS = [
      "--git=",        "(default: ./) git repository directory",
      "--app=",        "(default: ./) application directory",
      "--server-url=", "(default:  -) server url to send report",
    ]

    def self.parse!(argv = ARGV)
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

      def without_last_equal(str)
        str.gsub(/=$/, "")
      end
    end
  end
end
