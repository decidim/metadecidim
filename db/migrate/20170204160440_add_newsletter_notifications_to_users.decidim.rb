# frozen_string_literal: true

# This migration comes from decidim (originally 20170203150545)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddNewsletterNotificationsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_users, :newsletter_notifications, :boolean, null: false, default: false
  end
end
