# frozen_string_literal: true

# This migration comes from decidim_accountability (originally 20200320105903)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class IndexForeignKeysInDecidimAccountabilityResults < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_accountability_results, :external_id
  end
end
