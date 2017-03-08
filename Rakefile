namespace :gem do
  task :install do
    system("gem build jobs_importer.gemspec")
    system("gem install jobs_importer-0.1.0.gem")
    system("rm jobs_importer-0.1.0.gem")
  end
end
