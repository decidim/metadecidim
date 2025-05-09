# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20170113114245)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddTextSearchIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :decidim_proposals_proposals, :title, name: "decidim_proposals_proposal_title_search"
    add_index :decidim_proposals_proposals, :body, name: "decidim_proposals_proposal_body_search"
  end
end
