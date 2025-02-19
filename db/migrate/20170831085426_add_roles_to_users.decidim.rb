# frozen_string_literal: true

# This migration comes from decidim (originally 20170727125445)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_users, :roles, :string, array: true, default: []
  end
end
