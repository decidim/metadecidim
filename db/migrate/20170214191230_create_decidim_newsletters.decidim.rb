# frozen_string_literal: true

# This migration comes from decidim (originally 20170213081133)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class CreateDecidimNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_newsletters do |t|
      t.jsonb :subject
      t.jsonb :body
      t.references :organization
      t.references :author, foreign_key: { to_table: :decidim_users }
      t.integer :total_recipients
      t.integer :total_deliveries
      t.datetime :sent_at

      t.timestamps
    end
  end
end
