require "spec_helper"

module MetricsSatellite
  describe Reporter do
    let(:reporter) do
      described_class.new(
        "growthforecast.example.com",
        "service",
        "section"
      )
    end

    describe "#report" do
      let(:summaries) do
        { :a => 1, :b => 2 }
      end

      it "sends request to server" do
        RestClient.should_receive(:post).
          with("http://growthforecast.example.com/api/service/section/a", :number => 1)
        RestClient.should_receive(:post).
          with("http://growthforecast.example.com/api/service/section/b", :number => 2)
        reporter.report(summaries)
      end
    end
  end
end
