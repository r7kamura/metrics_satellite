require "spec_helper"

module MetricsSatellite
  describe Runner do
    let(:runner) do
      described_class.new(argv)
    end

    describe ".run" do
      subject(:run) do
        runner.run
      end

      context "when type is collect" do
        let(:argv) do
          %w[--type collect --host example.com]
        end

        let(:collectors) do
          runner.send(:collectors)
        end

        it "call #run for each collector class" do
          collectors.each do |collector|
            collector.any_instance.should_receive(:run)
          end
          subject
        end
      end
    end
  end
end
