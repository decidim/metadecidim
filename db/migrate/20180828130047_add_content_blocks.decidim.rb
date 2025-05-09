# frozen_string_literal: true

# This migration comes from decidim (originally 20180724103814)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddContentBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_content_blocks do |t|
      t.integer :decidim_organization_id, null: false, index: true
      t.string :manifest_name, null: false, index: true
      t.string :scope, null: false, index: true
      t.jsonb :options
      t.datetime :published_at, index: true
      t.integer :weight
      t.references
    end

    add_index(
      :decidim_content_blocks,
      [:decidim_organization_id, :scope, :manifest_name],
      unique: true,
      name: "idx_dcdm_content_blocks_uniq_org_id_scope_manifest_name"
    )
  end
end
