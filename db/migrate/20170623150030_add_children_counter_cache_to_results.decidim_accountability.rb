# frozen_string_literal: true

# This migration comes from decidim_accountability (originally 20170623144902)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddChildrenCounterCacheToResults < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_accountability_results, :children_count, :integer, default: 0
  end
end
