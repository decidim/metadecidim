# frozen_string_literal: true

# This migration comes from decidim_conferences (originally 20181004144411)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddConferencesPartner < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_conferences_partners do |t|
      t.references :decidim_conference, index: true
      t.string :name, null: false
      t.string :partner_type, null: false
      t.integer :weight, null: false, default: 0
      t.string :link
      t.string :logo, null: false

      t.timestamps
    end

    add_index :decidim_conferences_partners, [:weight, :partner_type]
  end
end
