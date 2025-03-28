# frozen_string_literal: true

# This migration comes from decidim (originally 20181218171503)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddUserGroupsSwitchToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :user_groups_enabled, :boolean, null: false, default: false
    execute "UPDATE decidim_organizations set user_groups_enabled = true"
  end
end
