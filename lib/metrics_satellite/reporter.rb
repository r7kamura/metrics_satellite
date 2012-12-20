require "rest_client"

module MetricsSatellite
  class Reporter
    attr_reader :host, :service, :section

    def initialize(host, service, section)
      @host    = host
      @service = service
      @section = section
    end

    def report(summaries)
      summaries.each do |key, count|
        post(key, count)
      end
    end

    private

    def post(key, count)
      RestClient.post(compose_url(key), :number => count)
    end

    def compose_url(graph)
      "http://#{host}/api/#{service}/#{section}/#{graph}"
    end
  end
end
