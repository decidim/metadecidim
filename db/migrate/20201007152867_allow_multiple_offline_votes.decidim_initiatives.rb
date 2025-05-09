# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20191118105634)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AllowMultipleOfflineVotes < ActiveRecord::Migration[5.2]
  class InitiativesTypeScope < ApplicationRecord
    self.table_name = :decidim_initiatives_type_scopes
  end

  class Initiative < ApplicationRecord
    self.table_name = :decidim_initiatives
    belongs_to :scoped_type, class_name: "InitiativesTypeScope"
  end

  def change
    rename_column :decidim_initiatives, :offline_votes, :old_offline_votes
    add_column :decidim_initiatives, :offline_votes, :jsonb, default: {}

    Initiative.reset_column_information

    Initiative.includes(:scoped_type).find_each do |initiative|
      scope_key = initiative.scoped_type.decidim_scopes_id || "global"

      offline_votes = {
        scope_key => initiative.old_offline_votes.to_i,
        "total" => initiative.old_offline_votes.to_i
      }

      # rubocop:disable Rails/SkipsModelValidations
      initiative.update_column(:offline_votes, offline_votes)
      # rubocop:enable Rails/SkipsModelValidations
    end

    remove_column :decidim_initiatives, :old_offline_votes
  end
end
