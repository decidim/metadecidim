# frozen_string_literal: true

# This migration comes from decidim (originally 20201011081626)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddCurrentSuspensionIdToDecidimUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_users, :suspension_id, :integer
  end
end
