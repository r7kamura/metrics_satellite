module MetricsSatellite
  # Report given summaries data to server
  class Reporter
    attr_reader :server_url, :service_name

    def initialize(server_url, service_name)
      @server_url   = server_url
      @service_name = service_name
    end

    def report(summaries)
      summaries.each do |summary|
        summary.contents.each do |key, value|
          post(summary.service, key, value)
        end
      end
    end

    private

    def post(service, key, value)
      RestClient.post(compose_url(service, key), :number => value)
    end

    def compose_url(section_name, graph_name)
      "#{server_url}/#{service_name}/#{section_name}/#{graph_name}"
    end
  end
end
