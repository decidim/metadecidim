# frozen_string_literal: true

# This migration comes from decidim_comments (originally 20210529095942)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddDeletedAtColumnToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :decidim_comments_comments, :deleted_at, :datetime
  end
end
