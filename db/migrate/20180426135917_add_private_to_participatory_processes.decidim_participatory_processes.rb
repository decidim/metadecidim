# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20180122110007)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddPrivateToParticipatoryProcesses < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_participatory_processes, :private_space, :boolean, default: false
  end
end
