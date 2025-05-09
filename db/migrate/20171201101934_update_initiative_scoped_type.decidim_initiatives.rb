# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20171017095143)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class UpdateInitiativeScopedType < ActiveRecord::Migration[5.1]
  class InitiativesTypeScope < ApplicationRecord
    self.table_name = :decidim_initiatives_type_scopes
  end

  class Scope < ApplicationRecord
    self.table_name = :decidim_scopes

    # Scope to return only the top level scopes.
    #
    # Returns an ActiveRecord::Relation.
    def self.top_level
      where parent_id: nil
    end
  end

  class Organization < ApplicationRecord
    self.table_name = :decidim_organizations

    has_many :scopes, foreign_key: "decidim_organization_id", class_name: "Scope"

    # Returns top level scopes for this organization.
    #
    # Returns an ActiveRecord::Relation.
    def top_scopes
      @top_scopes ||= scopes.top_level
    end
  end

  class Initiative < ApplicationRecord
    self.table_name = :decidim_initiatives

    belongs_to :scoped_type,
               class_name: "InitiativesTypeScope"

    belongs_to :organization,
               foreign_key: "decidim_organization_id",
               class_name: "Organization"
  end

  def up
    Initiative.find_each do |initiative|
      initiative.scoped_type = InitiativesTypeScope.find_by(
        decidim_initiatives_types_id: initiative.type_id,
        decidim_scopes_id: initiative.decidim_scope_id || initiative.organization.top_scopes.first
      )

      initiative.save!
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Cannot undo initialization of mandatory attribute"
  end
end
