# frozen_string_literal: true

# This migration comes from decidim (originally 20180123125432)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddOmnipresentBannerShortDescriptionToDecidimOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_organizations, :omnipresent_banner_short_description, :jsonb
  end
end
