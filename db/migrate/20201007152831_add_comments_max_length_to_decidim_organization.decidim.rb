# frozen_string_literal: true

# This migration comes from decidim (originally 20200707132401)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddCommentsMaxLengthToDecidimOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :comments_max_length, :integer, default: 1000
  end
end
