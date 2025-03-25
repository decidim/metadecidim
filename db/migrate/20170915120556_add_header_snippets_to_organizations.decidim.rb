# frozen_string_literal: true

# This migration comes from decidim (originally 20170913092351)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddHeaderSnippetsToOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_organizations, :header_snippets, :text
  end
end
