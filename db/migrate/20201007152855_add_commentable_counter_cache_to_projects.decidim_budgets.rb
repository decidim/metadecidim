# frozen_string_literal: true

# This migration comes from decidim_budgets (originally 20200827154129)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddCommentableCounterCacheToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_budgets_projects, :comments_count, :integer, null: false, default: 0, index: true
    Decidim::Budgets::Project.reset_column_information
    Decidim::Budgets::Project.unscoped.find_each(&:update_comments_count)
  end
end
