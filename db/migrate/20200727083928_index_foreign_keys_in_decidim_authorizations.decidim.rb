# frozen_string_literal: true

# This migration comes from decidim (originally 20200320105909)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class IndexForeignKeysInDecidimAuthorizations < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_authorizations, :unique_id
  end
end
