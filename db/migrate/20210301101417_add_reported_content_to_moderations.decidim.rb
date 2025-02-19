# frozen_string_literal: true

# This migration comes from decidim (originally 20201013071533)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddReportedContentToModerations < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_moderations, :reported_content, :text
  end
end
