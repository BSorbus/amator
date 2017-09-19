require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require File.expand_path(File.dirname(__FILE__) + "/../lib/pwid")

set :environment, :production
set :output, "#{Rails.root}/log/cron_log.log"

#every '30 6 * * 1-5' do
#  rake "cronjobs:pwid_sync"
#end

every '30 8 * * 1-5' do
  rake "cronjobs:pwid_sync"
end
