# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20210310120750)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddFollowableCounterCacheToParticipatoryProcesses < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_participatory_processes, :follows_count, :integer, null: false, default: 0, index: true

    reversible do |dir|
      dir.up do
        Decidim::ParticipatoryProcess.reset_column_information
        Decidim::ParticipatoryProcess.unscoped.find_each do |record|
          record.class.reset_counters(record.id, :follows)
        end
      end
    end
  end
end
