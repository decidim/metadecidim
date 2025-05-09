# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20170922152432)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
# Migration that creates the decidim_initiatives_committee_members table
class CreateDecidimInitiativesCommitteeMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_initiatives_committee_members do |t|
      t.references :decidim_initiatives, index: {
        name: "index_decidim_committee_members_initiative"
      }
      t.references :decidim_users, index: {
        name: "index_decidim_committee_members_user"
      }
      t.integer :state, index: true, null: false, default: 0

      t.timestamps
    end
  end
end
