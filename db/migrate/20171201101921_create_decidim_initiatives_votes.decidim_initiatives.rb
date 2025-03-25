# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20170917072556)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class CreateDecidimInitiativesVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_initiatives_votes do |t|
      t.references :decidim_initiative, null: false, index: true
      t.references :decidim_author, null: false, index: true
      t.integer :scope, null: false, default: 0

      t.timestamps
    end
  end
end
