# frozen_string_literal: true

# This migration comes from decidim (originally 20190412105836)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_follows, [:decidim_followable_id, :decidim_followable_type], name: "index_follows_followable_id_and_type"
    add_index :decidim_user_group_memberships, [:decidim_user_group_id, :decidim_user_id], name: "index_user_group_memberships_group_id_user_id"
    add_index :decidim_users, [:id, :type]
    add_index :decidim_users, [:invited_by_id, :invited_by_type]
    add_index :versions, [:item_id, :item_type]
  end
end
