# frozen_string_literal: true

# This migration comes from decidim (originally 20181211090933)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddAreaToActionLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_action_logs, :decidim_area_id, :integer
  end
end
