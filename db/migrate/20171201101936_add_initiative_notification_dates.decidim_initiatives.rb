# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20171019103358)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddInitiativeNotificationDates < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_initiatives,
               :first_progress_notification_at, :datetime, index: true

    add_column :decidim_initiatives,
               :second_progress_notification_at, :datetime, index: true
  end
end
