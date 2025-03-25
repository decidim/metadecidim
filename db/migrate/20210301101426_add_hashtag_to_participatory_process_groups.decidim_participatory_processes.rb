# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20201007215105)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddHashtagToParticipatoryProcessGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_participatory_process_groups, :hashtag, :string
  end
end
