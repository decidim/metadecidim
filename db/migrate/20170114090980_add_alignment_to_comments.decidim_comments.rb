# frozen_string_literal: true

# This migration comes from decidim_comments (originally 20161216102820)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddAlignmentToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_comments_comments, :alignment, :integer, null: false, default: 0
  end
end
