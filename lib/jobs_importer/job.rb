module JobsImporter
  class Job
    attr_reader :partner_id
    attr_reader :title
    attr_reader :category_id
    attr_reader :expires_at

    JOB_SERVICE = ENV["JOB_SERVICE"]

    def initialize(**kwargs)
      @partner_id = kwargs[:partner_id]
      @title = kwargs[:title]
      @category_id = kwargs[:category_id]
      @expires_at = expires_at_datetime(kwargs[:expires_at])
    end

    def save
      response = Net::HTTP.post(
        URI(JOB_SERVICE),
        job_params.to_json,
        "Content-Type" => "application/json"
      )
      puts response.body
    end

    private

    def job_params
      {
        job: {
          partner_id: partner_id,
          title: title,
          category_id: category_id,
          expires_at: expires_at.to_s,
          state: "draft"
        }
      }
    end

    def expires_at_datetime(expires_at)
      day, month, year = expires_at.split("/").map &:to_i

      DateTime.new(year, month, day)
    end
  end
end
