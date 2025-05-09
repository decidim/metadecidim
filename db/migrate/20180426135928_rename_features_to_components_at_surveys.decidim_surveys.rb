# frozen_string_literal: true

# This migration comes from decidim_surveys (originally 20180305133837)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class RenameFeaturesToComponentsAtSurveys < ActiveRecord::Migration[5.1]
  def change
    rename_column :decidim_surveys_surveys, :decidim_feature_id, :decidim_component_id

    if index_name_exists?(:decidim_surveys_surveys, "index_decidim_surveys_surveys_on_decidim_feature_id")
      rename_index :decidim_surveys_surveys, "index_decidim_surveys_surveys_on_decidim_feature_id", "index_decidim_surveys_surveys_on_decidim_component_id"
    end
  end
end
