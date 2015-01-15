require "careers"

namespace :feed do
  desc "Import new jobs"
  task :import => :environment do
    entries = Careers::Feed.fetch
    entries.each do |entry|
      unless Job.exists? guid: entry.guid
        job = Job.new
        job.guid = entry.guid
        job.url = entry.url
        job.title = entry.job_title
        job.summary = entry.summary
        job.allows_remote = entry.allows_remote
        job.published_at = entry.published_at.to_s
        job.company = Company.find_or_create_by(name: entry.company)
        entry.categories.each do |category|
          job.categories << Category.find_or_create_by(name: category)
        end
        entry.location.split(";").each do |location|
          job.locations << Location.find_or_create_by(name: location.strip)
        end
        job.save
      end
    end
  end
end
