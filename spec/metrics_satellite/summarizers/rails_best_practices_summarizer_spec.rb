require "spec_helper"

module MetricsSatellite
  describe RailsBestPracticesSummarizer do
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
        mock(:exist? => true, :read => content)
      end

      context "when any warning is found" do
        let(:content) do
          <<-EOF
            <!DOCTYPE HTML>
            <html>
            <head>
            </head>
            <body>
              <h1></h1>
              <p></p>
              <p>Found #{count} warnings.</p>
            </body>
            </html>
          EOF
        end

        let(:count) do
          100
        end

        it "creates summary of Brakeman" do
          subject.count.should == count
        end
      end

      context "when any warning is not found" do
        let(:content) do
          <<-EOF
            <!DOCTYPE HTML>
            <html>
            <head>
            </head>
            <body>
              <h1></h1>
              <p></p>
              <p>No error found. Cool!</p>
            </body>
            </html>
          EOF
        end

        it "creates summary of Brakeman with count as 0" do
          subject.count.should == 0
        end
      end
    end
  end
end
