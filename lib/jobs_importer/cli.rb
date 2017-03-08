module JobsImporter
  class CLI

    def initialize(filename)
      raise "Invalid file" unless valid_file?(filename)

      Importer.import filename
    end

    private

    def valid_file?(filename)
      File.exist?(filename)
    end
  end
end
