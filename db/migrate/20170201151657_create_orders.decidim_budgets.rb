# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20170130095615)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_budgets_orders do |t|
      t.references :decidim_user, index: true
      t.references :decidim_feature, index: true
      t.datetime :checked_out_at

      t.timestamps
    end

    add_index :decidim_budgets_orders, [:decidim_user_id, :decidim_feature_id], unique: true, name: "decidim_budgets_order_user_feature_unique"
  end
end
