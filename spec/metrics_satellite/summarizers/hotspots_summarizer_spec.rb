require "spec_helper"

module MetricsSatellite
  describe HotspotsSummarizer do
    let(:summarizer) do
      described_class.new
    end

    describe "#create" do
      subject do
        summarizer.send(:create)
      end

      before do
        summarizer.stub(:pathname => pathname)
      end

      let(:pathname) do
        mock(:readlines => lines, :exist? => true)
      end

      let(:lines) do
        count.times.to_a
      end

      let(:count) do
        10
      end

      it "creates summary of Hotspots" do
        subject[:count].should == count
      end
    end
  end
end
