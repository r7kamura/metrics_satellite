module MetricsSatellite
  class FlayCollector < Collector
    def collect
      system("flay", :out => file)
    end
  end
end
