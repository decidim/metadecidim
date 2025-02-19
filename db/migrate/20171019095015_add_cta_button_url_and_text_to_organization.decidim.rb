# frozen_string_literal: true

# This migration comes from decidim (originally 20171017084546)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddCtaButtonUrlAndTextToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_organizations, :cta_button_text, :jsonb
    add_column :decidim_organizations, :cta_button_path, :string
  end
end
