# frozen_string_literal: true

# This migration comes from decidim (originally 20170125152026)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddWeightToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_features, :weight, :integer, default: 0
  end
end
