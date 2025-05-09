# frozen_string_literal: true

# This migration comes from decidim_comments (originally 20161130143508)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_comments_comments do |t|
      t.text :body, null: false
      t.references :decidim_commentable, null: false, polymorphic: true, index: { name: "decidim_comments_comment_commentable" }
      t.references :decidim_author, null: false, index: { name: "decidim_comments_comment_author" }

      t.timestamps
    end

    add_index :decidim_comments_comments, :created_at
  end
end
