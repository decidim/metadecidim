# frozen_string_literal: true

# This migration comes from decidim (originally 20161214152811)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddLogoToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_organizations, :logo, :string
  end
end
