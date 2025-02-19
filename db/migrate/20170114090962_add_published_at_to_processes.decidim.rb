# frozen_string_literal: true

# This migration comes from decidim (originally 20161025125300)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddPublishedAtToProcesses < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_participatory_processes, :published_at, :datetime, index: true
  end
end
