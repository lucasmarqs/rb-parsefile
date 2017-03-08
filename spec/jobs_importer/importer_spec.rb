require 'rspec'
require 'jobs_importer/importer'
require 'jobs_importer/job'
require 'tempfile'

RSpec.describe JobsImporter::Importer do

  describe ".import" do
    subject { described_class.run "jobs.txt" }

    before do
      allow(JobsImporter::Importer).to receive(:run)
    end

    it "runs importer" do
      subject

      expect(JobsImporter::Importer).to have_received(:run)
    end
  end

  describe "#initialize" do
    subject(:importer) { described_class.new(filename) }

    let(:filename) { file.path }
    let(:read_limit) { 4 }
    let(:file) { Tempfile.new('foo') }

    before do
      file.write file_content
      file.rewind
    end

    after do
      file.unlink
    end

    let(:file_content) do
      <<~TXT
      partnerId|title|categoryId|ExpiresAt
      1123|Vendedor|3|21/1/2017
      1245|Vendedor de cosméticos|7|4/9/2016
      1371|Operador de Call Center|11|12/9/2017
      1397|Operador de Call Center|11|21/08/2017
      2411|Operador de Call Center|11|13/12/2017
      TXT
    end

    it "defines filename attribute" do
      expect(importer.filename).to eq filename
    end

    it "defines read_limit attribute" do
      expect(importer.read_limit).to eq read_limit
    end
  end
end
