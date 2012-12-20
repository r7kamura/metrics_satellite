require "spec_helper"

module MetricsSatellite
  describe BrakemanSummarizer do
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

      let(:content) do
        <<-EOF
          <!DOCTYPE HTML>
          <html>
          <head>
          </head>
          <body>
            <h2 id="summary"></h2>
            <table>
              <tbody>
                <tr>
                  <td>Scanned/Reported</td>
                  <td>total</td>
                </tr>
                <tr>
                  <td>Security Warnings</td>
                  <td>#{count}</td>
                </tr>
              </tbody>
            </table>
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
  end
end
