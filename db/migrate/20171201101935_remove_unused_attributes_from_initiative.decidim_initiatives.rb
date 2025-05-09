# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20171017103029)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class RemoveUnusedAttributesFromInitiative < ActiveRecord::Migration[5.1]
  def change
    remove_column :decidim_initiatives, :banner_image, :string
    remove_column :decidim_initiatives, :decidim_scope_id, :integer, index: true
    remove_column :decidim_initiatives, :type_id, :integer, index: true
  end
end
