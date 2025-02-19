# frozen_string_literal: true

# This migration comes from decidim_conferences (originally 20221116084952)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddWeightToConferences < ActiveRecord::Migration[6.1]
  def change
    add_column :decidim_conferences, :weight, :integer, null: false, default: 0
  end
end
