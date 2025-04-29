# frozen_string_literal: true

# This migration comes from decidim (originally 20170116110851)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_identities do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.references :decidim_user, null: false, index: true
    end

    add_index :decidim_identities, [:provider, :uid], unique: true
  end
end
