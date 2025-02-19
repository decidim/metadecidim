# frozen_string_literal: true

# This migration comes from decidim (originally 20200323094443)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddIdToContentBlocksScope < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_content_blocks, :scoped_resource_id, :integer
  end
end
