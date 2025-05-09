# frozen_string_literal: true

# This migration comes from decidim (originally 20180314085339)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class RenameMaximumVotesPerProposalToThresholdPerProposal < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL.squish
      UPDATE decidim_components
      SET settings = jsonb_set(
        settings::jsonb,
        array['global'],
        (settings->'global')::jsonb - 'maximum_votes_per_proposal' || jsonb_build_object('threshold_per_proposal', settings->'global'->'maximum_votes_per_proposal')
        )
      WHERE manifest_name = 'proposals'
    SQL
  end

  def down
    execute <<~SQL.squish
      UPDATE decidim_components
      SET settings = jsonb_set(
        settings::jsonb,
        array['global'],
        (settings->'global')::jsonb - 'threshold_per_proposal' || jsonb_build_object('maximum_votes_per_proposal', settings->'global'->'threshold_per_proposal')
        )
      WHERE manifest_name = 'proposals'
    SQL
  end
end
