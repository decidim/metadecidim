# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20201006140511)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddOnlineMeetingUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_meetings_meetings, :online_meeting_url, :string
  end
end
