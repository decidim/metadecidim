# frozen_string_literal: true

# This migration comes from decidim (originally 20170120120733)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddUserGroupsVerified < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_user_groups, :verified, :boolean, default: false
  end
end
