require "spec_helper"

module MetricsSatellite
  describe GuidelineSummarizer do
    before do
      summarizer.stub(:pathname => pathname, :lines => lines)
    end

    let(:summarizer) do
      described_class.new
    end

    let(:lines) do
      <<-EOF.each_line.map(&:strip)
        lib/metrics_satellite.rb
          1: Line length  84 should be less than  80 characters

        AbcComplexityChecker: 1
        LongLineChecker: 2
        LongMethodChecker: 3
      EOF
    end

    let(:pathname) do
      mock(:exist? => true)
    end

    describe "#summarize" do
      subject do
        summarizer.summarize
      end

      it "creates summary of Guideline" do
        subject[:abc_complexity].should == 1
        subject[:long_line].should      == 2
        subject[:long_method].should    == 3
      end
    end

    describe "#summarized_lines" do
      subject do
        summarizer.send(:summarized_lines)
      end

      it "extracts summarized lines from report" do
        should == <<-EOF.each_line.map(&:strip)
          AbcComplexityChecker: 1
          LongLineChecker: 2
          LongMethodChecker: 3
        EOF
      end
    end
  end
end
