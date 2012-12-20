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
        mock(:each_line => each_line, :exist? => true)
      end

      let(:each_line) do
        ["Total score (lower is better) = #{total_score}\n"]
      end

      let(:total_score) do
        100
      end

      it "creates summary of Flay" do
        subject.total_score.should == total_score
      end
    end
  end
end
