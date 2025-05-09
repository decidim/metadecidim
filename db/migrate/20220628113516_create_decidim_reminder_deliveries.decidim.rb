# frozen_string_literal: true

# This migration comes from decidim (originally 20211209121040)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateDecidimReminderDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :decidim_reminder_deliveries do |t|
      t.belongs_to :decidim_reminder, index: true, foreign_key: true
      t.timestamps
    end
  end
end
