# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20181211112538)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddReferenceToInitiatives < ActiveRecord::Migration[5.2]
  class Initiative < ApplicationRecord
    self.table_name = :decidim_initiatives

    belongs_to :organization,
               foreign_key: "decidim_organization_id",
               class_name: "Decidim::Organization"

    include Decidim::Participable
    include Decidim::HasReference
  end

  def change
    add_column :decidim_initiatives, :reference, :string

    reversible do |dir|
      dir.up do
        Initiative.find_each(&:touch)
      end
    end
  end
end
