# frozen_string_literal: true

# This migration comes from decidim (originally 20180705134647)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateDecidimMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_metrics do |t|
      t.date :day, null: false, index: true
      t.string :metric_type, null: false, index: true
      t.integer :cumulative, null: false
      t.integer :quantity, null: false
      t.references :decidim_organization, null: false, index: true
      t.references :participatory_space, polymorphic: true, index: { name: "index_metric_on_participatory_space_id_and_type" }
      t.references :related_object, polymorphic: true, index: { name: "index_metric_on_related_object_id_and_type" }
      t.references :decidim_category
    end
  end
end
