# frozen_string_literal: true

# This migration comes from decidim_accountability (originally 20220331150008)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddTitleToTimelineEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :decidim_accountability_timeline_entries, :title, :jsonb
  end
end
