# frozen_string_literal: true

# This migration comes from decidim_conferences (originally 20210408204953)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AllowNullLogoColumnInDecidimConferencesPartnersTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :decidim_conferences_partners, :logo, true
  end
end
