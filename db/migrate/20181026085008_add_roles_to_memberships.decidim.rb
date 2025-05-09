# frozen_string_literal: true

# This migration comes from decidim (originally 20181011080252)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddRolesToMemberships < ActiveRecord::Migration[5.2]
  def up
    add_column :decidim_user_group_memberships, :role, :string, default: "requested"
    execute("UPDATE decidim_user_group_memberships SET role = 'creator'")
    change_column_null :decidim_user_group_memberships, :role, false
    add_index(
      :decidim_user_group_memberships,
      %w(role decidim_user_group_id),
      where: "(role = 'creator')",
      name: "decidim_group_membership_one_creator_per_group",
      unique: true
    )
  end

  def down
    remove_column :decidim_user_group_memberships, :role
    remove_index(
      :decidim_user_group_memberships,
      name: "decidim_group_membership_one_creator_per_group"
    )
  end
end
