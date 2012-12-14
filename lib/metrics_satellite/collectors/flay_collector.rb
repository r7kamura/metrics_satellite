module MetricsSatellite
  class FlayCollector < Collector
    def run
      system("flay", :out => file)
    end
  end
end
