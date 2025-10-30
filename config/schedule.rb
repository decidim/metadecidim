# frozen_string_literal: true


every 1.day, at: "1:30 am", roles: [:worker] do
  rake "decidim:participants:delete_inactive_participants"
end

every 1.day, at: "2:00 am", roles: [:worker] do
  rake "decidim:open_data:export"
end

every 1.day, at: "4:00 am", roles: [:worker] do
  rake "decidim:metrics:all"
end

every 1.day, at: "5:00 am", roles: [:worker] do
  rake "decidim:delete_download_your_data_files"
end

every 1.day, at: "5:00 am", roles: [:worker] do
  rake "decidim:mailers:notifications_digest_daily"
end

every 1.day, at: "6:00 am", roles: [:worker] do
  rake "decidim:reminders:all"
end

every 1.day, at: "7:00 am", roles: [:worker] do
  rake "decidim_initiatives:check_validating"
end

every 1.day, at: "7:30 am", roles: [:worker] do
  rake "decidim_initiatives:check_published"
end

every 1.day, at: "8:00 am", roles: [:worker] do
  rake "decidim_initiatives:notify_progress"
end

every :saturday, at: "5:00 am", roles: [:worker] do
  rake "decidim:mailers:notifications_digest_weekly"
end
