# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20200702123209)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateMeetingServicesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_meetings_services do |t|
      t.jsonb :title
      t.jsonb :description
      t.bigint :decidim_meeting_id, null: false, index: true

      t.timestamps
    end
  end
end
