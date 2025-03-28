# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20180711075004)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:39 UTC
class RemoveIndexCounterCacheCoauthorshipsToProposals < ActiveRecord::Migration[5.2]
  def change
    remove_index :decidim_proposals_proposals, name: "idx_decidim_proposals_proposals_on_proposal_coauthorships_count"
  end
end
