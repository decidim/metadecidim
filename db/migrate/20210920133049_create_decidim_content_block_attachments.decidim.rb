# frozen_string_literal: true

# This migration comes from decidim (originally 20210419165805)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateDecidimContentBlockAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :decidim_content_block_attachments do |t|
      t.string :name
      t.references :decidim_content_block, null: false, index: { name: "decidim_content_block_attachments_on_content_block" }
    end
  end
end
