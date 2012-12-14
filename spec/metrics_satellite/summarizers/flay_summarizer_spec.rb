require "spec_helper"

module MetricsSatellite
  describe FlaySummarizer do
    let(:summarizer) do
      described_class.new
    end

    describe "#summarize" do
      subject do
        summarizer.summarize
      end

      it do
        should be_a Summary
      end
    end
  end
end
