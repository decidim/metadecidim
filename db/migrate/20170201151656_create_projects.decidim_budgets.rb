# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20170127114122)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_budgets_projects do |t|
      t.jsonb :title
      t.jsonb :description
      t.jsonb :short_description
      t.integer :budget, null: false
      t.references :decidim_feature, index: true
      t.references :decidim_scope, index: true
      t.references :decidim_category, index: true

      t.timestamps
    end
  end
end
