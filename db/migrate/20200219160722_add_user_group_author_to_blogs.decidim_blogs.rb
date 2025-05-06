# frozen_string_literal: true

# This migration comes from decidim_blogs (originally 20191212162606)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddUserGroupAuthorToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_blogs_posts, :decidim_user_group_id, :integer
  end
end
