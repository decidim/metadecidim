# frozen_string_literal: true

# This migration comes from decidim_comments (originally 20200320105911)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class IndexForeignKeysInDecidimCommentsComments < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_comments_comments, :decidim_user_group_id
  end
end
