# frozen_string_literal: true

# This migration comes from decidim (originally 20180918072506)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddVisibilityToActionLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_action_logs, :visibility, :string, default: "admin-only"
    add_index :decidim_action_logs, :visibility
  end
end
