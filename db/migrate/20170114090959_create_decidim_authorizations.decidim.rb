# frozen_string_literal: true

# This migration comes from decidim (originally 20161018091013)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateDecidimAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_authorizations do |t|
      t.string :name, null: false
      t.jsonb :metadata
      t.references :decidim_user, null: false, foreign_key: true, index: true

      t.timestamps
    end

    add_index :decidim_authorizations, [:decidim_user_id, :name], unique: true
  end
end
