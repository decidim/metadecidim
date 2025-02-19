# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20200827154214)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddCommentableCounterCacheToInitiatives < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives, :comments_count, :integer, null: false, default: 0, index: true
    Decidim::Initiative.reset_column_information
    Decidim::Initiative.find_each(&:update_comments_count)
  end
end
