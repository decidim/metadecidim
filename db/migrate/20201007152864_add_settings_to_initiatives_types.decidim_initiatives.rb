# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20191106144259)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddSettingsToInitiativesTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_types, :child_scope_threshold_enabled, :boolean, null: false, default: false
    add_column :decidim_initiatives_types, :only_global_scope_enabled, :boolean, null: false, default: false
  end
end
