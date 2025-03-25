# frozen_string_literal: true

# This migration comes from decidim (originally 20170725085104)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddShowStatisticsToParticipatoryProcesses < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_participatory_processes, :show_statistics, :boolean, default: true
  end
end
