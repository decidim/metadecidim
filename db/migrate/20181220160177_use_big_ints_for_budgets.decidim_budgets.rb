# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20181205141115)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class UseBigIntsForBudgets < ActiveRecord::Migration[5.2]
  def change
    change_column :decidim_budgets_projects, :budget, :bigint
  end
end
