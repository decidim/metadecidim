# frozen_string_literal: true

# This migration comes from decidim_debates (originally 20180118132243)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddAuthorToDebates < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_debates_debates, :decidim_author_id, :integer
  end
end
