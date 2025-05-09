# frozen_string_literal: true

# This migration comes from decidim (originally 20180508111640)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddTosVersionToOrganization < ActiveRecord::Migration[5.1]
  class Organization < ApplicationRecord
    self.table_name = :decidim_organizations
  end

  def up
    add_column :decidim_organizations, :tos_version, :datetime
    Organization.find_each do |organization|
      tos_version = Decidim::StaticPage.find_by(slug: ["terms-and-conditions", "terms-of-service"], organization:).updated_at
      organization.update(tos_version:)
    end
  end

  def down
    remove_columns :decidim_organizations, :tos_version
  end
end
