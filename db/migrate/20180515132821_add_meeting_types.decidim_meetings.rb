# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20180403145218)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddMeetingTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_meetings_meetings, :private_meeting, :boolean, default: false
    add_column :decidim_meetings_meetings, :transparent, :boolean, default: true
  end
end
