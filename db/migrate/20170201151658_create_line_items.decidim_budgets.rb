# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20170130101825)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_budgets_line_items do |t|
      t.references :decidim_order, index: true
      t.references :decidim_project, index: true
    end

    add_index :decidim_budgets_line_items, [:decidim_order_id, :decidim_project_id], unique: true, name: "decidim_budgets_line_items_order_project_unique"
  end
end
