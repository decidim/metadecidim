# frozen_string_literal: true

# This migration comes from decidim_pages (originally 20170110145040)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class RemoveCommentableFlagFromPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :decidim_pages_pages, :commentable
  end
end
