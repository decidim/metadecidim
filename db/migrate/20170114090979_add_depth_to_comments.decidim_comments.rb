# frozen_string_literal: true

# This migration comes from decidim_comments (originally 20161214082645)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddDepthToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_comments_comments, :depth, :integer, null: false, default: 0
  end
end
