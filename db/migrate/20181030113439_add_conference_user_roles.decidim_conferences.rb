# frozen_string_literal: true

# This migration comes from decidim_conferences (originally 20180626152015)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddConferenceUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_conference_user_roles do |t|
      t.integer :decidim_user_id
      t.integer :decidim_conference_id
      t.string :role
      t.timestamps
    end

    add_index :decidim_conference_user_roles,
              [:decidim_conference_id, :decidim_user_id, :role],
              unique: true,
              name: "index_unique_user_and_conference_role"
  end
end
