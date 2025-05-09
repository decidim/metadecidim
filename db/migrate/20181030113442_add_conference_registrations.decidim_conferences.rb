# frozen_string_literal: true

# This migration comes from decidim_conferences (originally 20180706104825)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddConferenceRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_conferences_conference_registrations do |t|
      t.references :decidim_user, null: false, index: { name: "index_decidim_conferences_registrations_on_decidim_user_id" }
      t.references :decidim_conference, null: false, index: { name: "index_conferences_registrations_on_decidim_conference" }

      t.timestamps
    end

    add_index :decidim_conferences_conference_registrations,
              [:decidim_user_id, :decidim_conference_id],
              unique: true,
              name: "decidim_conferences_registrations_user_conference_unique"
  end
end
