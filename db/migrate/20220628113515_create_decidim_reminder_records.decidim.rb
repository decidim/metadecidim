# frozen_string_literal: true

# This migration comes from decidim (originally 20211209121025)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateDecidimReminderRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :decidim_reminder_records do |t|
      t.string :state, :string, index: true, default: "active"
      t.belongs_to :decidim_reminder, index: true, foreign_key: true
      t.belongs_to :remindable, polymorphic: true, null: false, index: { name: "index_decidim_reminder_records_remindable" }
    end
  end
end
