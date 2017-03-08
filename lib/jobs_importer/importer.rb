require 'irb'

module JobsImporter
  class Importer

    attr_reader :filename
    attr_reader :read_limit

    def initialize(filename)
      @filename = filename
      @read_limit = lines_count * 8 / 10
    end

    def run
      File.open(filename) do |f|
        f.readline

        f.each_line.lazy.each do |line|
          job = build_job(line.split("|"))

          job.save if import_job?(job)
        end.first(read_limit)
      end
    end

    def self.import(filename)
      self.new(filename).run
    end

    private

    def build_job(row)
      Job.new(
        partner_id: row[0],
        title: row[1],
        category_id: row[2],
        expires_at: row[3]
      )
    end

    def import_job?(job)
      job.expires_at > Date.today
    end

    def lines_count
      @lines_count ||= `wc -l #{filename}`.strip[/^\d+/].to_i
    end
  end
end
