# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20181017084221)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class MakeAuthorPolymorhpicForProposalEndorsements < ActiveRecord::Migration[5.2]
  class ProposalEndorsement < ApplicationRecord
    self.table_name = :decidim_proposals_proposal_endorsements
  end

  def change
    remove_index :decidim_proposals_proposal_endorsements, :decidim_author_id

    add_column :decidim_proposals_proposal_endorsements, :decidim_author_type, :string

    reversible do |direction|
      direction.up do
        execute <<~SQL.squish
          UPDATE decidim_proposals_proposal_endorsements
          SET decidim_author_type = 'Decidim::UserBaseEntity'
        SQL
      end
    end

    add_index :decidim_proposals_proposal_endorsements,
              [:decidim_author_id, :decidim_author_type],
              name: "index_decidim_proposals_proposal_endorsements_on_decidim_author"

    change_column_null :decidim_proposals_proposal_endorsements, :decidim_author_id, false
    change_column_null :decidim_proposals_proposal_endorsements, :decidim_author_type, false

    ProposalEndorsement.reset_column_information
  end
end
