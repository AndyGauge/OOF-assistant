namespace :csv do
  desc "Import Exchange mailboxes see Readme"
  task :import, [:arg_1] => :environment do |task, args|
    require 'csv'
    $stdout.sync = true
    CSV.foreach(args.arg_1, headers: true, skip_lines: /^#/) do |row|
      Mailbox.where(email: row["PrimarySmtpAddress"]).first_or_create do |mailbox|
        mailbox.name = row['Name']
        print '.'
      end
    end
    print 'Done\n'
  end
end
