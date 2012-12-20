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

      before do
        summarizer.stub(:pathname => pathname)
      end

      let(:pathname) do
        mock(:readlines => lines, :exist? => true)
      end

      let(:lines) do
        ["Total score (lower is better) = #{total_score}\n"]
      end

      let(:total_score) do
        100
      end

      it "creates summary of Flay" do
        subject[:count].should == total_score
      end
    end
  end
end
