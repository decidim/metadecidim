# frozen_string_literal: true

# This migration comes from decidim (originally 20170206142116)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddPublishedAtToDecidimFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_features, :published_at, :datetime
    execute "UPDATE decidim_features SET published_at=#{quote(Time.current)}"
  end
end
