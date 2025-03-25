# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20210310120720)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddFollowableCounterCacheToInitiatives < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives, :follows_count, :integer, null: false, default: 0, index: true

    reversible do |dir|
      dir.up do
        Decidim::Initiative.reset_column_information
        Decidim::Initiative.find_each do |record|
          record.class.reset_counters(record.id, :follows)
        end
      end
    end
  end
end
