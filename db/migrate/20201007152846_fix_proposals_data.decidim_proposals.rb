# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20201002085508)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class FixProposalsData < ActiveRecord::Migration[5.2]
  class Proposal < ApplicationRecord
    self.table_name = :decidim_proposals_proposals
  end

  class Coauthorship < ApplicationRecord
    self.table_name = :decidim_coauthorships
  end

  class UserBaseEntity < ApplicationRecord
    self.table_name = :decidim_users
    self.inheritance_column = nil # disable the default inheritance
  end

  class Organization < ApplicationRecord
    self.table_name = :decidim_organizations
  end

  def up
    PaperTrail.request(enabled: false) do
      Proposal.find_each do |proposal|
        next if proposal.title.is_a?(Hash) && proposal.body.is_a?(Hash)

        coauthorship = Coauthorship.order(:id).find_by(coauthorable_type: "Decidim::Proposals::Proposal", coauthorable_id: proposal.id)
        author =
          if coauthorship.decidim_author_type == "Decidim::Organization"
            Organization.find_by(id: coauthorship.decidim_author_id)
          else
            UserBaseEntity.find_by(id: coauthorship.decidim_author_id)
          end

        locale = author.try(:locale).presence || author.try(:default_locale).presence || author.try(:organization).try(:default_locale).presence

        # rubocop:disable Rails/SkipsModelValidations
        values = {}
        values[:title] = { locale => proposal.title } unless proposal.title.is_a?(Hash)
        values[:body] = { locale => proposal.body } unless proposal.body.is_a?(Hash)

        proposal.update_columns(values)
        # rubocop:enable Rails/SkipsModelValidations
      end
    end
  end

  def down; end
end
