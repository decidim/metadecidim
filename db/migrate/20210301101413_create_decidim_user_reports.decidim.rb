# frozen_string_literal: true

# This migration comes from decidim (originally 20201010124756)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateDecidimUserReports < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_user_reports do |t|
      t.integer :user_moderation_id, foreign_key: true
      t.integer :user_id, null: false
      t.string :reason
      t.text :details

      t.timestamps
    end
    add_foreign_key :decidim_user_reports, :decidim_user_moderations, column: :user_moderation_id
    add_foreign_key :decidim_user_reports, :decidim_users, column: :user_id
  end
end
