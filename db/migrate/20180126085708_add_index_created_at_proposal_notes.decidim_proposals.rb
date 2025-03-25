# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20180115155220)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:39 UTC
class AddIndexCreatedAtProposalNotes < ActiveRecord::Migration[5.1]
  def change
    add_index :decidim_proposals_proposal_notes, :created_at
  end
end
