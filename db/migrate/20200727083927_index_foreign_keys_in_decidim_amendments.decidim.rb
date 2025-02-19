# frozen_string_literal: true

# This migration comes from decidim (originally 20200320105905)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class IndexForeignKeysInDecidimAmendments < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_amendments, :decidim_emendation_id
  end
end
