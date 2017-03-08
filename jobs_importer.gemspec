Gem::Specification.new do |s|
  s.name        = 'jobs_importer'
  s.version     = '0.1.0'
  s.summary     = "Jobs Importer"
  s.description = "Interface to import job from text file"

  s.authors     = ["Lucas Marques"]
  s.email       = 'lucas.smarques@outlook.com'

  s.files       = ["lib/jobs_importer.rb", "lib/jobs_importer/cli.rb", "lib/jobs_importer/importer.rb", "lib/jobs_importer/job.rb"]
  s.executables << 'jobs_importer'

  s.add_development_dependency('rspec')
end
