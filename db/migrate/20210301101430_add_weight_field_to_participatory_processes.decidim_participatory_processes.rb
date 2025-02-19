# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20210204154593)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddWeightFieldToParticipatoryProcesses < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_participatory_processes, :weight, :integer, null: false, default: true
  end
end
