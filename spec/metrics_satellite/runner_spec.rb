require "spec_helper"

module MetricsSatellite
  describe Runner do
    let(:runner) do
      described_class.new
    end

    describe ".run" do
      it "creates its instance and call #run" do
        described_class.any_instance.should_receive(:run)
        described_class.run
      end
    end

    describe "#run" do
      subject(:run) do
        runner.run(argv)
      end

      context "when ARGV[0] is collect" do
        let(:argv) do
          ["collect"]
        end

        let(:collectors) do
          runner.send(:collectors)
        end

        it "call #run for each collector class" do
          collectors.each {|collector| collector.should_receive(:run) }
          subject
        end
      end

      context "when ARGV[0] is unexpected value" do
        let(:argv) do
          ["unexpected value"]
        end

        it "exits" do
          runner.should_receive(:exit)
          subject
        end
      end
    end
  end
end
