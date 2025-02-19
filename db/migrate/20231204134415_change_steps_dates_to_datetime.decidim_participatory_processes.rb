# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20220315100140)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class ChangeStepsDatesToDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column :decidim_participatory_process_steps, :start_date, :datetime
    change_column :decidim_participatory_process_steps, :end_date, :datetime
  end
end
