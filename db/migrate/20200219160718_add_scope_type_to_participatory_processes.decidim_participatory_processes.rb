# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20200114142253)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddScopeTypeToParticipatoryProcesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :decidim_participatory_processes, :decidim_scope_type, foreign_key: true, index: true
  end
end
