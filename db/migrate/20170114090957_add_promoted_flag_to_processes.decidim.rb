# frozen_string_literal: true

# This migration comes from decidim (originally 20161013134732)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddPromotedFlagToProcesses < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_participatory_processes, :promoted, :boolean, default: false, index: true
  end
end
