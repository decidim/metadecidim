# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20170830081725)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddStartDateToProcesses < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_participatory_processes, :start_date, :date
    ActiveRecord::Base.connection.execute("UPDATE decidim_participatory_processes SET start_date = created_at")
  end
end
