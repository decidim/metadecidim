# frozen_string_literal: true

# This migration comes from decidim_comments (originally 20170504085413)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddRootCommentableToComments < ActiveRecord::Migration[5.0]
  def change
    change_table :decidim_comments_comments do |t|
      t.references :decidim_root_commentable, polymorphic: true, index: { name: "decidim_comments_comment_root_commentable" }
    end
  end
end
