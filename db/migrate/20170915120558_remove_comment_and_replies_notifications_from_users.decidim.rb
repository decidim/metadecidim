# frozen_string_literal: true

# This migration comes from decidim (originally 20170914092116)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class RemoveCommentAndRepliesNotificationsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :decidim_users, :comments_notifications
    remove_column :decidim_users, :replies_notifications
  end
end
