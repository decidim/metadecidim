# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20210217124802)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddRegistrationCustomContentToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_meetings_meetings, :customize_registration_email, :boolean, default: false, null: false
    add_column :decidim_meetings_meetings, :registration_email_custom_content, :jsonb
  end
end
