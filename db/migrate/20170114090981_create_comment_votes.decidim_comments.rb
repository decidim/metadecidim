# frozen_string_literal: true

# This migration comes from decidim_comments (originally 20161219150806)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateCommentVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_comments_comment_votes do |t|
      t.integer :weight, null: false
      t.references :decidim_comment, null: false, index: { name: "decidim_comments_comment_vote_comment" }
      t.references :decidim_author, null: false, index: { name: "decidim_comments_comment_vote_author" }

      t.timestamps
    end

    add_index :decidim_comments_comment_votes, [:decidim_comment_id, :decidim_author_id], unique: true, name: "decidim_comments_comment_vote_comment_author_unique"
  end
end
