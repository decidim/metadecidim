# frozen_string_literal: true

# This migration comes from decidim (originally 20181010044613)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class CreateDecidimContinuityBadgeStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_continuity_badge_statuses do |t|
      t.integer :current_streak, :integer, null: false, default: 0
      t.date :last_session_at, null: false
      t.references :subject, null: false, polymorphic: true, index: { name: "decidim_continuity_statuses_subject" }
    end
  end
end
