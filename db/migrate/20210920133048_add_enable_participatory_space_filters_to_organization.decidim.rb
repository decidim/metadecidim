# frozen_string_literal: true

# This migration comes from decidim (originally 20210412120115)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddEnableParticipatorySpaceFiltersToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :enable_participatory_space_filters, :boolean, default: true
  end
end
