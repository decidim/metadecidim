# frozen_string_literal: true

# This migration comes from decidim (originally 20170720135441)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddManagedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_users, :managed, :boolean, null: false, default: false
  end
end
