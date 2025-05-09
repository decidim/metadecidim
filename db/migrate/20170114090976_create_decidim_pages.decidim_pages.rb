# frozen_string_literal: true

# This migration comes from decidim_pages (originally 20161116121353)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateDecidimPages < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_pages_pages do |t|
      t.jsonb :title
      t.jsonb :body
      t.references :decidim_feature, index: true

      t.timestamps
    end
  end
end
