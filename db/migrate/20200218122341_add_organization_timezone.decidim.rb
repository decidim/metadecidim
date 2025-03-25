# frozen_string_literal: true

# This migration comes from decidim (originally 20200107142226)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddOrganizationTimezone < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :time_zone, :string, limit: 255, default: "UTC"
  end
end
