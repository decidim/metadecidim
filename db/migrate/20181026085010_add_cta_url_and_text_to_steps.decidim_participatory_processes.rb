# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20180926082635)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddCtaUrlAndTextToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_participatory_process_steps, :cta_text, :jsonb, default: {}
    add_column :decidim_participatory_process_steps, :cta_path, :string
  end
end
