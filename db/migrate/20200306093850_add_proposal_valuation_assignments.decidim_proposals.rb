# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20200203111239)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddProposalValuationAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_proposals_valuation_assignments do |t|
      t.references :decidim_proposal, null: false, index: { name: "decidim_proposals_valuation_assignment_proposal" }
      t.references :valuator_role, polymorphic: true, null: false, index: { name: "decidim_proposals_valuation_assignment_valuator_role" }

      t.timestamps
    end
  end
end
