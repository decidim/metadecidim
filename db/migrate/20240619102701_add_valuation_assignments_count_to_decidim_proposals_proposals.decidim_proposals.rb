# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20240404202756)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddValuationAssignmentsCountToDecidimProposalsProposals < ActiveRecord::Migration[6.1]
  def change
    add_column :decidim_proposals_proposals, :valuation_assignments_count, :integer, default: 0

    reversible do |dir|
      dir.up do
        Decidim::Proposals::Proposal.reset_column_information
        Decidim::Proposals::Proposal.unscoped.find_each do |record|
          Decidim::Proposals::Proposal.reset_counters(record.id, :valuation_assignments)
        end
      end
    end
  end
end
