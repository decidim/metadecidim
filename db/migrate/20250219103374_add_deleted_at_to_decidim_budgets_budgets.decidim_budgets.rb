# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20240828103724)
class AddDeletedAtToDecidimBudgetsBudgets < ActiveRecord::Migration[7.0]
  def change
    add_column :decidim_budgets_budgets, :deleted_at, :datetime
    add_index :decidim_budgets_budgets, :deleted_at
  end
end
