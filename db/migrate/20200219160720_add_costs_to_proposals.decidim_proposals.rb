# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20200210135152)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddCostsToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_proposals_proposals, :cost, :decimal
    add_column :decidim_proposals_proposals, :cost_report, :jsonb
    add_column :decidim_proposals_proposals, :execution_period, :jsonb
  end
end
