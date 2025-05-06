# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20200728075039)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddSelectedAtToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_budgets_projects, :selected_at, :date, index: true
  end
end
