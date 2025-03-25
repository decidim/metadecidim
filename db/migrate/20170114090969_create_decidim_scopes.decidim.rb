# frozen_string_literal: true

# This migration comes from decidim (originally 20161130105257)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class CreateDecidimScopes < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_scopes do |t|
      t.string :name, null: false, index: :uniqueness
      t.references :decidim_organization, foreign_key: true, index: true
      t.timestamps
    end
  end
end
