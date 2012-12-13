module MetricsSatellite
  class Flay < Command
    def run
      system("flay", :out => file)
    end
  end
end
