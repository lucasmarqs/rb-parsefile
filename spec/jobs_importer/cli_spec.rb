require 'rspec'
require 'jobs_importer/cli'
require 'jobs_importer/importer'

RSpec.describe JobsImporter::CLI do

  describe "#initialize" do
    subject { described_class.new "jobs.txt" }

    context "with a valid file" do
      before do
        allow(File).to receive(:exists?).and_return true
        allow(JobsImporter::Importer).to receive(:import)
      end

      it "initialize JobsImporter::Importer" do
        subject

        expect(JobsImporter::Importer).to have_received(:import)
      end
    end
  end
end
