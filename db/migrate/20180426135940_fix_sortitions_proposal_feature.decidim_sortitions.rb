# frozen_string_literal: true

# This migration comes from decidim_sortitions (originally 20180322085145)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class FixSortitionsProposalFeature < ActiveRecord::Migration[5.1]
  def up
    rename_column :decidim_sortitions_sortitions, :decidim_proposals_feature_id, :decidim_proposals_component_id
  end

  def down
    rename_column :decidim_sortitions_sortitions, :decidim_proposals_component_id, :decidim_proposals_feature_id
  end
end
