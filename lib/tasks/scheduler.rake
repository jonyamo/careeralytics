namespace :scheduler do
  desc "Updates DB with latest records"
  task :update => :environment do
    puts "Fetching latest records..."
    Rake::Task["feed:import"].execute
    puts "done."
  end

  desc "Purges old records from DB"
  task :cleanup => :environment do
    puts "Purging old records..."
    Job.delete_all("created_at < '#{60.days.ago}'")
    puts "done."
  end
end
