# frozen_string_literal: true

# This migration comes from decidim (originally 20201010124755)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class CreateDecidimUserModerations < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_user_moderations do |t|
      t.belongs_to :decidim_user, foreign_key: true
      t.integer :report_count, default: 0, null: false

      t.timestamps
    end
  end
end
