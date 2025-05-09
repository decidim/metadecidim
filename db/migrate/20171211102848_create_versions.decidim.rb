# frozen_string_literal: true

# This migration comes from decidim (originally 20171107103253)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
# This migration creates the `versions` table, the only schema PT requires.
# All other migrations PT provides are optional.
class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string :item_type, null: false
      t.integer :item_id, null: false
      t.string :event, null: false
      t.string :whodunnit
      t.jsonb :object

      t.datetime :created_at
    end
    add_index :versions, [:item_type, :item_id]
  end
end
