# frozen_string_literal: true

# This migration comes from decidim_sortitions (originally 20171215161358)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateDecidimModuleSortitionsSortitions < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_module_sortitions_sortitions do |t|
      t.references :decidim_feature, index: { name: "index_sortitions__on_feature" }

      t.references :decidim_category,
                   foreign_key: true,
                   index: { name: "index_sortitions__on_category" }

      t.integer :decidim_proposals_feature_id,
                index: { name: "index_sortitions__on_proposals_feature" }

      t.integer :dice, null: false
      t.integer :target_items, null: false
      t.timestamp :request_timestamp, null: false
      t.jsonb :selected_proposals

      t.timestamps
    end
  end
end
