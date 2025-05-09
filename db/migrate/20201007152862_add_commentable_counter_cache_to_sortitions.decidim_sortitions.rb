# frozen_string_literal: true

# This migration comes from decidim_sortitions (originally 20200827154036)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddCommentableCounterCacheToSortitions < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_sortitions_sortitions, :comments_count, :integer, null: false, default: 0, index: true
    Decidim::Sortitions::Sortition.reset_column_information
    Decidim::Sortitions::Sortition.find_each(&:update_comments_count)
  end
end
