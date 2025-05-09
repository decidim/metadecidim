# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20170810131100)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_meetings_registrations do |t|
      t.references :decidim_user, null: false, index: true
      t.references :decidim_meeting, null: false, index: true

      t.timestamps
    end

    add_index :decidim_meetings_registrations, [:decidim_user_id, :decidim_meeting_id], unique: true, name: "decidim_meetings_registrations_user_meeting_unique"
  end
end
