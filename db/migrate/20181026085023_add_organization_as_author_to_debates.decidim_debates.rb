# frozen_string_literal: true

# This migration comes from decidim_debates (originally 20181016132850)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddOrganizationAsAuthorToDebates < ActiveRecord::Migration[5.2]
  class Debate < ApplicationRecord
    self.table_name = :decidim_debates_debates
    include Decidim::HasComponent
  end

  class User < ApplicationRecord
    self.table_name = :decidim_users
  end

  def change
    add_column :decidim_debates_debates, :decidim_author_type, :string

    Debate.find_each do |debate|
      if debate.decidim_author_id.present?
        debate.decidim_author_type = "Decidim::UserBaseEntity"
      else
        debate.decidim_author_id = debate.organization.id
        debate.decidim_author_type = "Decidim::Organization"
      end
      debate.save!
    end

    add_index :decidim_debates_debates,
              [:decidim_author_id, :decidim_author_type],
              name: "index_decidim_debates_debates_on_decidim_author"
    change_column_null :decidim_debates_debates, :decidim_author_id, false
    change_column_null :decidim_debates_debates, :decidim_author_type, false
  end
end
