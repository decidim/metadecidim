# frozen_string_literal: true

# This migration comes from decidim (originally 20220323195258)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddIndexToDecidimUsersNotificationsSendingFrequency < ActiveRecord::Migration[6.0]
  def change
    add_index :decidim_users, :notifications_sending_frequency
  end
end
