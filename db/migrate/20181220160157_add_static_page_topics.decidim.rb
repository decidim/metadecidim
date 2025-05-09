# frozen_string_literal: true

# This migration comes from decidim (originally 20181023104416)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddStaticPageTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_static_page_topics do |t|
      t.column :title, :jsonb, null: false
      t.column :description, :jsonb, null: false
      t.references :organization, null: false
    end

    change_table :decidim_static_pages do |t|
      t.references :topic
    end
  end
end
